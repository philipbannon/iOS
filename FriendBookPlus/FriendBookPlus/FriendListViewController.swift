//
//  ViewController.swift
//  FriendBookPlus
//
//  Created by Philip Bannon on 06/01/2016.
//  Copyright © 2016 Philip Bannon. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var friendList = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        buildFriendList()

        self.tableView.dataSource = self
        self.tableView.delegate = self        
    }
    
    func buildFriendList() {
        createFriends("Philip Bannon", friendBirthday: "2010-01-01", friendNumber: "000-000-00-00", avatarImage: "profile")
        createFriends("Charles Bannon", friendBirthday: "2010-01-01", friendNumber: "000-000-00-00", avatarImage: "profile")
        createFriends("Caroline Bannon", friendBirthday: "2010-01-01", friendNumber: "000-000-00-00", avatarImage: "Butters-SPG")
        createFriends("John", friendBirthday: "2010-01-01", friendNumber: "000-000-00-00", avatarImage: "profile")
    }
    
    func createFriends(friendName :String, friendBirthday :String, friendNumber: String, avatarImage :String) {
        let newFriend = Friend()
        
        newFriend.name = friendName
        newFriend.birthday = friendBirthday
        newFriend.phoneNumber = friendNumber
        newFriend.avatar = UIImage(named: avatarImage)!
        
        self.friendList.append(newFriend)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let friend = self.friendList[indexPath.row]
        cell.textLabel!.text = friend.name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let friend = self.friendList[indexPath.row]
        self.performSegueWithIdentifier("friendDetailSegue", sender: friend)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailVC = segue.destinationViewController as! FriendDetailViewController
        detailVC.friend = sender as! Friend
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

