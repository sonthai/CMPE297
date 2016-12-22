//
//  CustomViewController2.swift
//  Assignment1
//
//  Created by Son Thai on 11/6/16.
//  Copyright © 2016 Son Thai. All rights reserved.
//

import UIKit

class CustomViewController2: UIViewController {
    @IBOutlet weak var temperatureTextLabel: UILabel!
    var temperature: Double?
    
    override func viewDidLoad() {
        self.title = "Temperature Converter"
        print("Temperature", temperature! as Double)
        let temp: Double = (temperature! - 32)*5/9
        print("Conversion ", temp as Double)
        self.temperatureTextLabel.text = "Celsius " + String(format: "%.2f", temp) + " °C"
        
    }
    
    @IBAction func popBack(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
