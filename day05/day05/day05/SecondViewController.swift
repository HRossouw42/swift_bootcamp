//
//  SecondViewController.swift
//  day05
//
//  Created by Harmun Rossouw on 2019/10/14.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SecondViewController: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    //button to center on self
    @IBAction func locateMeButton(_ sender: Any) {
        if let coor = mapView.userLocation.location?.coordinate{
            mapView.setCenter(coor, animated: true)
            let viewRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
            mapView.setRegion(viewRegion, animated: true)
        }
        //let viewRegion = MKCoordinateRegion(center: ecole42.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
        //MapView.setRegion(viewRegion, animated: false)
        
    }
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        case 2:
            mapView.mapType = .hybrid
        default:
            break;
        }
    }
    
    //https://stackoverflow.com/a/49191349
    let locationManager = CLLocationManager()
    
    let ecole42 = Pin(title: "Ecole 42",
         locationName: "96 Boulevard Bessières, 75017 Paris, France",
         discipline: "Coding School",
         coordinate: CLLocationCoordinate2D(latitude: 48.896724, longitude: 2.318504))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Load ecole pin and zoom to it
        mapView.addAnnotation(ecole42)
        let viewRegion = MKCoordinateRegion(center: ecole42.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
        mapView.setRegion(viewRegion, animated: false)
        
        //location manager settings
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }

        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
    }


}

