//
//  Entry.swift
//  Journal
//
//  Created by Ross McIlwaine on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    var timeStamp: NSDate
    var title: String
    var body: String
    
    init(timeStamp: NSDate = NSDate(), title: String, body: String) {
        
        self.timeStamp = timeStamp
        self.title = title
        self.body = body
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    
    return lhs.timeStamp == rhs.timeStamp && lhs.title == rhs.title && lhs.body == rhs.body
}