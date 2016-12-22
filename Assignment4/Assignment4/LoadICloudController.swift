//
//  LoadICloudController.swift
//  Assignment4
//
//  Created by Son Thai on 11/21/16.
//  Copyright © 2016 Son Thai. All rights reserved.
//

import UIKit


class LoadICloudController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var iCloudBtn: UIButton!
    @IBOutlet weak var displayView: UITextField!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let icloudkeyValue: NSUbiquitousKeyValueStore = NSUbiquitousKeyValueStore()
    
        displayView.text = icloudkeyValue.string(forKey: "Reason")
    
    }
    

    @IBAction func icloud(sender: UIButton) {
        self.performSegue(withIdentifier: "gotoCloud", sender: nil)
    }
    
}
