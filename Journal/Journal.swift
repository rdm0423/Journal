//
//  Journal.swift
//  Journal
//
//  Created by Ross McIlwaine on 5/12/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Journal: Equatable {
    
    private let kJournalTitle = "journalTitle"
    private let kEntries = "entries"
    
    var journalTitle: String
    var entries: [Entry]
    
    // Computed Property
    var dictionaryCopy: [String:AnyObject] {
        return [kJournalTitle: journalTitle, kEntries: entries.map{$0.dictionaryCopy}]
    }
    
    init(journalTitle: String, entries: [Entry] = []) {
        
        self.journalTitle = journalTitle
        self.entries = entries
    }
    
    init?(dictionary : [String:AnyObject]) {
        
        guard let journalTitle = dictionary[kJournalTitle] as? String,
        entriesDictionaryArray = dictionary[kEntries] as? [[String:AnyObject]] else {
            return nil
        }
        self.journalTitle = journalTitle
        self.entries = entriesDictionaryArray.flatMap{Entry(dictionary: $0)}
    }
}

func ==(lhs: Journal, rhs: Journal) -> Bool {
    
    return lhs.journalTitle == rhs.journalTitle && lhs.entries == rhs.entries
}