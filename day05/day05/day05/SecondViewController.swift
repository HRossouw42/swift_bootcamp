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
    
    var location : Cell?
    var initialLoc: Int = 0
    
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
    
    // using locations
    // https://stackoverflow.com/a/49191349
    let locationManager = CLLocationManager()
    
    let ecole42 = Pin(title: "Ecole 42",
         locationName: "96 Boulevard Bessières, 75017 Paris, France",
         discipline: "Coding School",
         coordinate: CLLocationCoordinate2D(latitude: 48.896724, longitude: 2.318504))
    
    let Joburg = Pin(title: "WeThinkCode Joburg Campus",
                       locationName: "84 Albertina Sisulu Rd, Johannesburg, 2000",
                       discipline: "The other coding school",
                       coordinate: CLLocationCoordinate2D(latitude: -26.204839, longitude: 28.040126))
    
    let Capetown = Pin(title: "WeThinkCode Cape Town Campus",
                       locationName: "84 Albertina Sisulu Rd, Johannesburg, 2000",
                       discipline: "Coding School",
                       coordinate: CLLocationCoordinate2D(latitude: -33.906930, longitude: 18.417554))
    
    func setLocationView(int: Int) {
        switch int {
        case 0:
            let viewRegion = MKCoordinateRegion(center: ecole42.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
            mapView.setRegion(viewRegion, animated: false)
        case 1:
            let viewRegion = MKCoordinateRegion(center: Joburg.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
            mapView.setRegion(viewRegion, animated: false)
//        case 2:
//            let viewRegion = MKCoordinateRegion(center: ecole42.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
//            mapView.setRegion(viewRegion, animated: false)
        default:
            let viewRegion = MKCoordinateRegion(center: ecole42.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
            mapView.setRegion(viewRegion, animated: false)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setLocationView(int: initialLoc)
        print(location?.coord)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        setUI()
        
        //Load ecole pin and zoom to it
        mapView.addAnnotation(ecole42)
        mapView.addAnnotation(Joburg)
        mapView.addAnnotation(Capetown)
        
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
        
        
        //setLocationView(initialLoc: initialLocation)
        print(initialLoc)
    }


}

