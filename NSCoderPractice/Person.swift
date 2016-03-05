//
//  Person.swift
//  NSCoderPractice
//
//  Created by Mehdi Salemi on 3/4/16.
//  Copyright © 2016 MxMd. All rights reserved.
//

import Foundation

class Person : NSObject, NSCoding {
    var name : String!
    var age : Int!
    var location : String!
    
    init(name:String){
        self.name = name
    }
    
    func encodeWithCoder(archiver: NSCoder) {
        // archive the information inside the Person, one property at a time
        archiver.encodeObject(name, forKey: "Name")
    }
    
    required init(coder unarchiver: NSCoder) {
        super.init()
        // Unarchive the data, one property at a time
        name = unarchiver.decodeObjectForKey("Name") as! String
    }
    
}