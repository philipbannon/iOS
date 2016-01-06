//
//  FriendDetailViewController.swift
//  FriendBookPlus
//
//  Created by Philip Bannon on 06/01/2016.
//  Copyright © 2016 Philip Bannon. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var friend = Friend()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.nameLabel.text = "Name: \(self.friend.name)"
        self.phoneLabel.text = "Phone: : \(self.friend.phoneNumber)"
        self.birthdayLabel.text = "DOB: \(self.friend.birthday)"
        self.avatarImageView.image = self.friend.avatar
        self.avatarImageView.contentMode = UIViewContentMode.ScaleAspectFit

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
