//
//  ColorViewController.swift
//  ColourPlate
//
//  Created by Philip Bannon on 07/01/2016.
//  Copyright © 2016 Philip Bannon. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var colorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        if (self.view.backgroundColor ==  UIColor.redColor() )
        {
            self.colorLabel.text = "Red!"
        } else if (self.view.backgroundColor == UIColor.blueColor()) {
            self.colorLabel.text = " Blue!!"
        } else if (self.view.backgroundColor == UIColor.greenColor()) {
            self.colorLabel.text = "Green!"
        } else if (self.view.backgroundColor == UIColor.purpleColor()) {
            self.colorLabel.text = "Purple!"
        } else if (self.view.backgroundColor == UIColor(red: 255, green: 0, blue: 128, alpha: 1.0)) {
            self.colorLabel.text = "Pink!"
        } else if (self.view.backgroundColor == UIColor.yellowColor()) {
            self.colorLabel.text = "Yellow!"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
