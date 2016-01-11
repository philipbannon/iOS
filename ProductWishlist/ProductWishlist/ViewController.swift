//
//  ViewController.swift
//  ProductWishlist
//
//  Created by Philip Bannon on 07/01/2016.
//  Copyright © 2016 Philip Bannon. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var products :[Products] = []
    
    var selectedProduct :Products? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
//        makeSampleProduct()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let request = NSFetchRequest(entityName: "Products")
        
        var results : [AnyObject]?
        
        do {
            try results = context.executeFetchRequest(request)
        }catch {
            results = nil
        }
        
        if (results != nil) {
            self.products = results as! [Products]
        }
        
        self.tableView.reloadData()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        let product = self.products[indexPath.row]

        cell.textLabel!.text = product.title
        cell.imageView!.image = UIImage(data: product.image!)
        
        return cell
        
    }
    
    func makeSampleProduct() {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let product = NSEntityDescription.insertNewObjectForEntityForName("Products", inManagedObjectContext: context) as! Products
        
        product.title = "A6 Shoes"
        product.image = UIImageJPEGRepresentation(UIImage(named: "Butters-SPG.png")!, 1)

        
        do {
            try context.save()
        }catch {
            print("oops")
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedProduct = self.products[indexPath.row]
        self.performSegueWithIdentifier("tableViewToDetailSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "tableViewToDetailSegue") {
            let detailVC = segue.destinationViewController as! ProductDetailViewController
            detailVC.product = self.selectedProduct
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

