//
//  ViewController.swift
//  Assignment5
//
//  Created by Son Thai on 11/20/16.
//  Copyright © 2016 Son Thai. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var fromView: UIView!
    @IBOutlet weak var fromAddr: UITextField!
    @IBOutlet weak var fromCity: UITextField!
    @IBOutlet weak var fromState: UITextField!
    @IBOutlet weak var fromZip: UITextField!
    
    @IBOutlet weak var toView: UIView!
    @IBOutlet weak var toAddr: UITextField!
    @IBOutlet weak var toCity: UITextField!
    @IBOutlet weak var toState: UITextField!
    @IBOutlet weak var toZip: UITextField!
    
    @IBOutlet weak var mapBtn: UIButton!
    @IBOutlet weak var routeBtn: UIButton!
    
    //var _sourceLocation: CLLocationCoordinate2D?
    //var _dstLocation: CLLocationCoordinate2D?
    
    weak var delegate: RouteViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fromAddr.text = "2046 42nd Ave"
        fromCity.text = "San Francisco"
        fromState.text = "CA"
        fromZip.text = "94116"
        
        toAddr.text = "508 N Whisman Rd"
        toCity.text = "Mountain View"
        toState.text = "CA"
        toZip.text = "94043"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if (segue.identifier == "routeSegue") {
            let routeViewController = segue.destination as! RouteViewController
            let srcString: String = "\(fromAddr.text) \(fromCity.text) \(fromState.text) \(fromZip.text)"
            let dstString: String = "\(toAddr.text) \(toCity.text) \(toState.text) `\(toZip.text)"
            routeViewController._srcString = srcString
            routeViewController.fromAddr = fromAddr.text!
            routeViewController.fromSubtitle = "\(fromCity.text!), \(fromState.text!) \(fromZip.text!)"
            routeViewController.toAddr = toAddr.text!
            routeViewController.toSubtitle = "\(toCity.text!), \(toState.text!) \(toZip.text!)"
            routeViewController._dstString = dstString
            
        }
    }
    
    @IBAction func click(sender: UIButton) {
        if (sender.tag == 0) {
            self.performSegue(withIdentifier: "mapSegue", sender: nil)
        } else if (sender.tag == 1) {
            self.performSegue(withIdentifier: "routeSegue", sender: nil)
        }
    }
    
    @nonobjc func textFieldDidEndEditing(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }


}

