//
//  EntryController.swift
//  Journal
//
//  Created by Ross McIlwaine on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    static func createEntry(title: String, bodyText: String, journal: Journal) {
        
        let entry = Entry(title: title, body: bodyText)
        JournalController.sharedController.addEntryToJournal(entry, journal: journal)
        
    }
    
    
//    private let kEntries = "entries"
//    
//    static let sharedController = EntryController()
//    
//    var entries: [Entry]
//    
//    init() {
//        self.entries = []
//        loadFromPersistentStorage()
//    }
//    
//    func addEntry(entry: Entry) {
//        
//        entries.append(entry)
//        saveToPersistentStorage()
//    }
//    
//    func removeEntry(entry: Entry) {
//        
//        if let entryIndex = entries.indexOf(entry) {
//            
//            entries.removeAtIndex(entryIndex)
//            saveToPersistentStorage()
//        }
//        
//    }
//    func saveToPersistentStorage() {
//        
//        NSUserDefaults.standardUserDefaults().setObject(entries.map{$0.dictionaryCopy}, forKey: kEntries)
//    }
//    
//    func loadFromPersistentStorage() {
//        
//        guard let entriesDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(kEntries) as? [[String:AnyObject]] else {
//            
//            return
//        }
//        entries = entriesDictionaryArray.flatMap{Entry(dictionary: $0)}
//    }
}