//
//  PeopleTableViewController.swift
//  NSCoderPractice
//
//  Created by Mehdi Salemi on 3/4/16.
//  Copyright © 2016 MxMd. All rights reserved.
//

import UIKit
import Foundation

class PeopleTableViewController: UITableViewController {
    
    var people : [Person]!
    
    var addButton : UIBarButtonItem!
    
    var peopleFilePath : String {
        let manager = NSFileManager.defaultManager()
        let url = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
        return url.URLByAppendingPathComponent("peopleAr").path!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addNew:")
                self.people = NSKeyedUnarchiver.unarchiveObjectWithFile(peopleFilePath) as? [Person] ?? [Person]()
        if people.count > 0 {
            people.append(Person(name:"Mehdi Stephen"))
            people.append(Person(name:"Mattie Rogers"))
            people.append(Person(name:"Rich Fronning"))
        } else {
            people = [Person]()
            people.append(Person(name:"Mehdi Salemi"))
            people.append(Person(name:"Cristiano Ronaldo"))
            people.append(Person(name:"Mark Wahlburg"))
        }
        print(peopleFilePath)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        navigationItem.rightBarButtonItem = addButton
        tableView.reloadData()
        NSKeyedArchiver.archiveRootObject(self.people, toFile: peopleFilePath)
    }
    
    @IBAction func addNew(sender:AnyObject){
        self.performSegueWithIdentifier("addNew", sender: self)
    }
    
    // Mark : Table View Functions
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("tableCell")!
        
        let person = people[indexPath.row]
        cell.textLabel?.text = person.name
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }
}
