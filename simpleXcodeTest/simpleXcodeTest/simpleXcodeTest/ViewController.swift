//
//  ViewController.swift
//  simpleXcodeTest
//
//  Created by Philip Bannon on 05/01/2016.
//  Copyright © 2016 Philip Bannon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func buttonTapped(sender: AnyObject) {
        self.view.backgroundColor = UIColor.redColor()
    }
    
    @IBAction func resetBtnTapped(sender: AnyObject) {
        self.view.backgroundColor = UIColor.whiteColor()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

