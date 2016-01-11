//
//  NewProductViewController.swift
//  ProductWishlist
//
//  Created by Philip Bannon on 11/01/2016.
//  Copyright © 2016 Philip Bannon. All rights reserved.
//

import UIKit
import CoreData

class NewProductViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var storeTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
           let imageTapRecognizer = UITapGestureRecognizer(target: self, action: "imageTapped")
        
        self.imageView.addGestureRecognizer(imageTapRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fixOrientation(img:UIImage) -> UIImage {
        
        if (img.imageOrientation == UIImageOrientation.Up) {
            return img;
        }
        
        UIGraphicsBeginImageContextWithOptions(img.size, false, img.scale);
        let rect = CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height)
        img.drawInRect(rect)
        
        let normalizedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return normalizedImage;
        
    }

    @IBAction func saveTapped(sender: AnyObject) {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let product = NSEntityDescription.insertNewObjectForEntityForName("Products", inManagedObjectContext: context) as! Products
        
        product.title = titleTextField.text
        product.store = storeTextField.text
        product.image = UIImageJPEGRepresentation(self.imageView.image!, 1)
        
        
        do {
            try context.save()
        }catch {
            print("oops")
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imageTapped() {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)) {
            let cameraViewController = UIImagePickerController()
            cameraViewController.sourceType = UIImagePickerControllerSourceType.Camera
            
            cameraViewController.delegate = self
            
            self.presentViewController(cameraViewController, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.imageView.image = fixOrientation(image)
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}
