//
//  MapViewController.swift
//  Assignment5
//
//  Created by Son Thai on 11/24/16.
//  Copyright © 2016 Son Thai. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var _mapView: MKMapView!
    @IBOutlet weak var backBtn: UIButton!
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func loadPinOnMap(userLocationCoord: CLLocationCoordinate2D) {
        print("UserLocation: \(userLocationCoord)")
        let latDelta: CLLocationDegrees = 0.01
        let lonDelta: CLLocationDegrees = 0.01
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        //let pointLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.748538, -122.500465)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(userLocationCoord, span)
        _mapView.setRegion(region, animated: true)
        
        //let pinLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.748538, -122.500465)
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = userLocationCoord
        objectAnnotation.title = "My Current Location"
        self._mapView.addAnnotation(objectAnnotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        let userLocationCoord: CLLocationCoordinate2D = userLocation.coordinate
        let long = userLocation.coordinate.longitude
        let lat = userLocation.coordinate.latitude
        print("Long \(long), lat: \(lat)")
        self.loadPinOnMap(userLocationCoord: userLocationCoord)
        locationManager.stopUpdatingLocation()
    }
}
