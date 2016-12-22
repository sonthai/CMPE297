//
//  RouteViewController.swift
//  Assignment5
//
//  Created by Son Thai on 11/24/16.
//  Copyright © 2016 Son Thai. All rights reserved.
//

import MapKit
import CoreLocation


class RouteViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var _mapView: MKMapView!
    @IBOutlet weak var backBtn: UIButton!
    var sourceLocation: CLLocationCoordinate2D?
    var destinationLocation: CLLocationCoordinate2D?
    var _srcString: String?
    var _dstString: String?
    var fromAddr: String?, fromSubtitle: String?
    var toAddr: String?, toSubtitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        _mapView.delegate = self
        
        self.geocodeAddress(key: "src", _addressString: _srcString!)
        self.geocodeAddress(key: "dst", _addressString: _dstString!)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay:MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.red
        renderer.lineWidth = 4.0
        
        return renderer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func back(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func geocodeAddress(key: String, _addressString: String) {
        CLGeocoder().geocodeAddressString(_addressString, completionHandler: {(placemarks: [CLPlacemark]?, error: Error?) in
            if (error != nil) {
                print("Error \(error)")
                return
            }
            
            if (placemarks!.count > 0) {
                let placemark = placemarks![0]
                let location = placemark.location
                if (key == "src") {
                    self.sourceLocation = location?.coordinate
                } else if (key == "dst"){
                    self.destinationLocation = location?.coordinate
                }
                if (self.sourceLocation != nil && self.destinationLocation != nil) {
                     self.renderRouteView()
                }
            }
        })
    }

    func renderRouteView() {
        let sourcePlacemark = MKPlacemark(coordinate: self.sourceLocation!, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: self.destinationLocation!, addressDictionary: nil)
        
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        let sourceAnnotation = MKPointAnnotation();
        sourceAnnotation.title = fromAddr
        sourceAnnotation.subtitle = fromSubtitle
        
        if let location = sourcePlacemark.location {
            sourceAnnotation.coordinate = location.coordinate
        }
        
        
        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.title = toAddr
        destinationAnnotation.subtitle = toSubtitle
        
        if let location = destinationPlacemark.location {
            destinationAnnotation.coordinate = location.coordinate
        }
        
        self._mapView.showAnnotations([sourceAnnotation, destinationAnnotation], animated: true)
        
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        directionRequest.requestsAlternateRoutes = false
        
        let directions = MKDirections(request: directionRequest)
        
        directions.calculate(completionHandler: {(response, error) -> Void in
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                
                return
            }
            
            self._mapView.add(response.routes[0].polyline)
            let rect = response.routes[0].polyline.boundingMapRect
            self._mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
            
        })
    }
}
