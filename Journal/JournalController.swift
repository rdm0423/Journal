//
//  JournalController.swift
//  Journal
//
//  Created by Ross McIlwaine on 5/12/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class JournalController {
    
    private let kJournals = "storedJournals"
    
    static let sharedController = JournalController()
    
    var journals: [Journal] = []
    
    init() {
        loadFromPersistentStorage()
    }
    
    func addJournal(name: String) {
        
        let journal = Journal(journalTitle: name)
        journals.append(journal)
        
        saveToPersistentStorage()
    }
    
    func removeJournal(journal: Journal) {
        
        if let journalIndex = journals.indexOf(journal) {
            journals.removeAtIndex(journalIndex)
            saveToPersistentStorage()
        }
    }
    
    func addEntryToJournal(entry: Entry, journal: Journal) {
        
        journal.entries.append(entry)
        saveToPersistentStorage()
    }
    
    func removeEntryFromJournal(entry: Entry, journal: Journal) {
        
        
    }
    
    func saveToPersistentStorage() {
        
        NSUserDefaults.standardUserDefaults().setObject(journals.map{$0.dictionaryCopy}, forKey: kJournals)
    }
    
    func loadFromPersistentStorage() {
        
        guard let journalsDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(kJournals) as? [[String:AnyObject]] else {
            return
        }
        journals = journalsDictionaryArray.flatMap{Journal(dictionary: $0)}
    }
}