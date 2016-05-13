//
//  EntryTableViewController.swift
//  Journal
//
//  Created by Ross McIlwaine on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryTableViewController: UITableViewController {

    var journal: Journal?
    var entries: [Entry]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let journal = journal {
            updateWithJournal(journal)
            entries = journal.entries
        }
        
//        setNeedsStatusBarAppearanceUpdate()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    }
    
    func updateWithJournal(journal: Journal) {
        
        self.journal = journal
        
//        self.titleTextField.text = entry.title
//        self.bodyTextView.text = entry.body
    }
    
//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return .LightContent
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return entries?.count ?? 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath: indexPath)
        
        let entry = entries?[indexPath.row]
        
        
        cell.textLabel?.text = entry?.title
        cell.detailTextLabel?.text = "\(entry?.timeStamp)"
        
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
            
//            let entry = entries?[indexPath.row]
//            
//            JournalController.sharedController.removeEntryFromJournal(entry, journal: journ)
            
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
        let entryDetailVC = segue.destinationViewController as? EntryDetailViewController
        if segue.identifier == "showEntrySegue" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let entry = entries?[indexPath.row]
                
                entryDetailVC?.entry = entry
                
                
            }
        } else if segue.identifier == "addEntrySegue" {
            if let journal = journal {
                entryDetailVC?.journal = journal
            }
        }
    }
}
