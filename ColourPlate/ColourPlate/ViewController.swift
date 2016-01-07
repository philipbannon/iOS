//
//  ViewController.swift
//  ColourPlate
//
//  Created by Philip Bannon on 06/01/2016.
//  Copyright © 2016 Philip Bannon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var selectedColor : UIColor?
    
    let color :[UIColor] = [UIColor.redColor(), UIColor.blueColor(), UIColor.greenColor(),
                            UIColor.purpleColor(), UIColor(red: 255, green: 0, blue: 128, alpha: 1.0),
                            UIColor.yellowColor()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = self.color[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.color.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedColor = self.color[indexPath.row]
        self.performSegueWithIdentifier("navToColorScreen", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if ( segue.identifier == "navToColorScreen" ) {
             segue.destinationViewController.view.backgroundColor = self.selectedColor
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

