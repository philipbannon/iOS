//
//  ProductDetailViewController.swift
//  ProductWishlist
//
//  Created by Philip Bannon on 07/01/2016.
//  Copyright © 2016 Philip Bannon. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var outletStoreLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var product : Products? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.titleLabel.text = self.product!.title
        self.outletStoreLabel.text = self.product!.store
        self.imageView.image = UIImage(data: self.product!.image!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
