//
//  CustomViewController.swift
//  Assignment1
//
//  Created by Son Thai on 11/6/16.
//  Copyright © 2016 Son Thai. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
    @IBOutlet weak var temperatureTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Temperature Converter"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func click(sender: UIButton) {
        if (sender.tag == 0) {
            print("Conversion")
            if (!temperatureTextField.text!.isEmpty) {
                self.performSegue(withIdentifier: "moveFirstToSecond", sender: nil)
            }
        } else if (sender.tag == 1) {
            print("Close application")
            exit(0);
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController2 = segue.destination as! CustomViewController2
        viewController2.temperature = Double(temperatureTextField.text!)
    }
    
    
}
