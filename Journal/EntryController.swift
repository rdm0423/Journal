//
//  EntryController.swift
//  Journal
//
//  Created by Ross McIlwaine on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    static let sharedController = EntryController()
    
    var entries: [Entry]
    
    init() {
        self.entries = []
    }
    
    func addEntry(entry: Entry) {
        
        entries.append(entry)
    }
    
    func removeEntry(entry: Entry) {
        
        if let entryIndex = entries.indexOf(entry) {
        
            entries.removeAtIndex(entryIndex)
        }
    }
}