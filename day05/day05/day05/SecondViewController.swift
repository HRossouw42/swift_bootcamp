//
//  SecondViewController.swift
//  day05
//
//  Created by Harmun Rossouw on 2019/10/14.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController {

    @IBOutlet weak var MapView: MKMapView!
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            MapView.mapType = .standard
        case 1:
            MapView.mapType = .satellite
        case 2:
            MapView.mapType = .hybrid
        default:
            break;
        }
    }
    
    let ecole42 = Pin(title: "Ecole 42",
         locationName: "96 Boulevard Bessières, 75017 Paris, France",
         discipline: "Coding School",
         coordinate: CLLocationCoordinate2D(latitude: 48.896724, longitude: 2.318504))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Load ecole pin and zoom to it
        MapView.addAnnotation(ecole42)
        let viewRegion = MKCoordinateRegion(center: ecole42.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
        MapView.setRegion(viewRegion, animated: false)
    }


}

