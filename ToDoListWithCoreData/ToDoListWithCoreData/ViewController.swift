//
//  ViewController.swift
//  ToDoListWithCoreData
//
//  Created by Philip Bannon on 07/01/2016.
//  Copyright © 2016 Philip Bannon. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var tableView: UITableView!

    let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    var txtField : UITextField!
    
    var todoItems : [ItemEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        loadItems()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = self.todoItems[indexPath.row]
        cell.textLabel!.text = item.title
        return cell
    }
    
    func configurationTextField(textField : UITextField) {
        textField.placeholder = "Enter New Item"
        self.txtField = textField
    }
    
    func loadItems() {
        do {
            try context.save()
        } catch {
            print("something went wrong")
        }
        
        let request = NSFetchRequest(entityName: "ItemEntity")
        
        var results : [AnyObject]?
        
        do {
            results = try context.executeFetchRequest(request)
        } catch {
            results = nil
        }
        
        if (results != nil) {
            self.todoItems = results as! [ItemEntity]
        }
        
        self.tableView.reloadData()

    }
    
    func saveNewItem() {
        let item = NSEntityDescription.insertNewObjectForEntityForName("ItemEntity", inManagedObjectContext: context) as! ItemEntity
        item.title = txtField.text
        
        loadItems()
    }
    
    @IBAction func addButtonPressed(sender: AnyObject) {
        alertPopup()
    }
    
    func alertPopup() {
        let alert = UIAlertController(title: "Add New Item", message: nil, preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
            UIAlertAction in alert.dismissViewControllerAnimated(true, completion: nil)
        }
        
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default) {
            UIAlertAction in self.saveNewItem()
        }
        
        alert.addTextFieldWithConfigurationHandler(configurationTextField)
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

