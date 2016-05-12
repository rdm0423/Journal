//
//  Entry.swift
//  Journal
//
//  Created by Ross McIlwaine on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let timeStampKey = "timeStamp"
    private let titleKey = "title"
    private let bodyKey = "body"
    
    var timeStamp: NSDate
    var title: String
    var body: String
    
    init(timeStamp: NSDate = NSDate(), title: String, body: String) {
        
        self.timeStamp = timeStamp
        self.title = title
        self.body = body
    }
    
    init? (dictionary : [String:AnyObject]) {
        
        guard let timeStamp = dictionary[timeStampKey] as? NSDate,
            title = dictionary[titleKey] as? String,
            body = dictionary[bodyKey] as? String else {
                
                self.timeStamp = NSDate()
                self.title = ""
                self.body = ""
                return nil
        }
        
        self.timeStamp = timeStamp
        self.title = title
        self.body = body
    }
    
    func dictionaryCopy() -> Dictionary<String, AnyObject> {
        
        let dictionary = [
            timeStampKey : self.timeStamp,
            titleKey : self.title,
            bodyKey : self.body
        ]

        return dictionary
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    
    return lhs.timeStamp == rhs.timeStamp && lhs.title == rhs.title && lhs.body == rhs.body
}