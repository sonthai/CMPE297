//
//  ViewController.swift
//  FallDetection
//
//  Created by Son Thai on 12/3/16.
//  Copyright © 2016 Son Thai. All rights reserved.
//

import UIKit
import CoreMotion


class ViewController: UIViewController {

    @IBOutlet weak var detectionLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    let randomVal = 999999.0
    //var altimeter: CMAltimeter?
    var currentPos: Double?
    var mManager : CMMotionManager?
    var KfilterFactor = 0.2
    var threadholdPercentage = 7.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.blue
        currentPos = randomVal
        //altimeter = CMAltimeter()
        mManager = CMMotionManager();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    @IBAction func start(_ sender: UIButton) {
        currentPos = randomVal

        
        if  (mManager?.isAccelerometerAvailable)! {
            mManager?.startAccelerometerUpdates(to: OperationQueue.main, withHandler: {(data: CMAccelerometerData?, error: Error?) in
                if (error != nil) {
                    self.mManager?.stopAccelerometerUpdates()
                } else {
                    let x = (data?.acceleration.z)! * self.KfilterFactor + (data?.acceleration.z)!*(1.0-self.KfilterFactor)
                    
                    if (self.currentPos == self.randomVal) {
                        self.currentPos = x
                    } else {
                        let alterChange =  ((x - self.currentPos!)/self.currentPos!) * 100
                        if (abs(alterChange) > self.threadholdPercentage &&  x < self.currentPos!)
                        {
                            self.detectionLabel.text = "Phone Fall: Detected Fall Scenerio"
                            self.view.backgroundColor = UIColor.darkGray
                        }
                        
                        self.currentPos = x
                    }
                }
            })
        }
    
    }
    
    @IBAction func stop(_ sender: UIButton) {
        //altimeter?.stopRelativeAltitudeUpdates()
        mManager?.stopAccelerometerUpdates()
        self.detectionLabel.text = "Phone Fall: No Detected Fall Scenerio"
        self.view.backgroundColor = UIColor.blue
    }
}

