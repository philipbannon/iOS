//
//  friendListViewController.swift
//  FriendBook
//
//  Created by Philip Bannon on 05/01/2016.
//  Copyright © 2016 Philip Bannon. All rights reserved.
//

import UIKit

class friendListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let myFriendsList = ["Caroline Laporte", "John Smith", "Philip Bannon"]
    
    var selectedFriend = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myFriendsList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel!.text = myFriendsList[indexPath.row]
        
        return cell
    
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.selectedFriend = myFriendsList[indexPath.row]
        self.performSegueWithIdentifier("friendListViewFriendSegue", sender: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let detailedViewController = segue.destinationViewController as! FriendDetailViewController
        detailedViewController.name = self.selectedFriend
        
        if self.selectedFriend == "Philip Bannon" {
            detailedViewController.birthday = "21/04/1985"
        } else if self.selectedFriend == "John Smith" {
            detailedViewController.birthday = "01/01/1987"
        } else if self.selectedFriend == "Caroline Laporte" {
            detailedViewController.birthday = "24/08/1986"
        }
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
