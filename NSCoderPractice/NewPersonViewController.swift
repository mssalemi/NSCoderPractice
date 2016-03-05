//
//  NewPersonViewController.swift
//  NSCoderPractice
//
//  Created by Mehdi Salemi on 3/4/16.
//  Copyright © 2016 MxMd. All rights reserved.
//

import UIKit

class NewPersonViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func add(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
}
