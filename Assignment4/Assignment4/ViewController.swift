//
//  ViewController.swift
//  Assignment4
//
//  Created by Son Thai on 11/16/16.
//  Copyright © 2016 Son Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var locationTxt: UITextField!
    @IBOutlet weak var reasonTxt: UITextField!
    @IBOutlet weak var descTxt: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func click(sender: UIButton) {
        if  (sender.tag == 0) {
            let urlForCloud = FileManager.default.url(forUbiquityContainerIdentifier: nil)
            
            if (urlForCloud == nil) {
                print("No Cloud")
            } else {
                let icloudkeyValue: NSUbiquitousKeyValueStore = NSUbiquitousKeyValueStore()
                icloudkeyValue.set(locationTxt.text, forKey: "Location")
                icloudkeyValue.set(reasonTxt.text, forKey: "Reason")
                icloudkeyValue.set(descTxt, forKey: "Description")
                icloudkeyValue.synchronize()
                
            }
        } else if (sender.tag == 1) {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
}

