//
//  ViewController.swift
//  FitnessApp
//
//  Created by Son Thai on 11/26/16.
//  Copyright © 2016 Son Thai. All rights reserved.
//

import UIKit
import HealthKit
import CoreMotion

class ViewController: UIViewController {
    @IBOutlet weak var numOfSteps: UILabel!
    @IBOutlet weak var nofAsc: UILabel!
    @IBOutlet weak var nofDesc: UILabel!
    @IBOutlet weak var totalDist: UILabel!
    @IBOutlet weak var beginWorkout: UIButton!
    @IBOutlet weak var stopWorkout: UIButton!
    var pedometer: CMPedometer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pedometer = CMPedometer();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func click(sender: UIButton) {
        if (sender.tag == 0) {
            print("Begin workout")
            pedometer?.startUpdates(from: NSDate() as Date, withHandler: {
                (data, error) in
                if (error != nil) {
                    print("There was an eror obtaining pedometer data \(error)")
                } else {
                    DispatchQueue.main.async {
                        if (CMPedometer.isStepCountingAvailable()) {
                            self.numOfSteps.text = "\(data!.numberOfSteps)"
                            print("Step \(data!.numberOfSteps)")
                        }
                        if (CMPedometer.isFloorCountingAvailable()) {
                            self.nofAsc.text = "\((data?.floorsAscended)!.intValue)"
                            print("Asc  \((data?.floorsAscended)!.intValue)")
                            self.nofDesc.text = "\((data?.floorsDescended)!.intValue)"
                            print("Desc \((data?.floorsDescended)!.intValue)")
                        }
                        
                        if (CMPedometer.isDistanceAvailable()) {
                            let distStr =  String(format: "%.2f" , (data?.distance)!.doubleValue)
                            self.totalDist.text = distStr
                            print("Distance \(distStr)")
                        }
                    }
                }
            })
        } else if (sender.tag == 1) {
            print("Stop workout")
            pedometer?.stopUpdates()
        }
    }

}

