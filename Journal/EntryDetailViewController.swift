//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Ross McIlwaine on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {

    var entry: Entry?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let entry = entry {
            updateWithEntry(entry)
        }
        
        self.navigationItem.title = entry?.title
        
        setNeedsStatusBarAppearanceUpdate()
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateWithEntry(entry: Entry) {
        
        self.entry = entry
        
        self.titleTextField.text = entry.title
        self.bodyTextView.text = entry.body
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        
        if let entry = self.entry {
            
            entry.title = self.titleTextField.text!
            entry.body = self.bodyTextView.text
            entry.timeStamp = NSDate()
        } else {
            
            let newEntry = Entry(title: self.titleTextField.text!, body: self.bodyTextView.text!)
            EntryController.sharedController.addEntry(newEntry)
            self.entry = newEntry
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func clearButtonTapped(sender: AnyObject) {
        
        self.titleTextField.text = ""
        self.bodyTextView.text = ""
    }
    
    // MARK: - Keyboard Dismiss
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
