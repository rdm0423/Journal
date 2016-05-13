//
//  JournalTableViewController.swift
//  Journal
//
//  Created by Ross McIlwaine on 5/12/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class JournalTableViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addJournalButtonTapped(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Title", message: "Create a New Journal Folder", preferredStyle: .Alert)
        
        let addTitleAction = UIAlertAction(title: "Add", style: .Default) { (_) in
            
            if let field = alertController.textFields![0] as? UITextField {
                
                // Create Journal String to be Saved
                let journalFolder = Journal(journalTitle: "\(field.text)")
//                print(journalFolder.journalTitle)
                JournalController.sharedController.addJournal(journalFolder.journalTitle)
                
                
            } else {
                
                // Did Not Type in Field
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in textField.placeholder = "Folder"
            
        }
        
        alertController.addAction(addTitleAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true) { 
            
        }
        // save to persistent storage on close?
        JournalController.sharedController.saveToPersistentStorage()
        
        tableView.reloadData()
    }
    
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return JournalController.sharedController.journals.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("journalCell", forIndexPath: indexPath)

        let journal = JournalController.sharedController.journals[indexPath.row]
        
        cell.textLabel?.text = journal.journalTitle
        cell.detailTextLabel?.text = "\(journal.entries.count) entries"
//        let numberOfEntries = JournalController.sharedController.journals.count
//        cell.detailTextLabel?.text = "\(numberOfEntries) Entries"

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            
            let journal = JournalController.sharedController.journals[indexPath.row]
            JournalController.sharedController.removeJournal(journal)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toEntriesSegue" {
            let journalTVC = segue.destinationViewController as? EntryTableViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                let journal = JournalController.sharedController.journals[indexPath.row]
                journalTVC?.journal = journal
                
            }
        }
        
    }
 

}
