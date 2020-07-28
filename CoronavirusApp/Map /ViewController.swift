//
//  ViewController.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 30/05/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lcoalizationSearch: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    
    lazy var locationManeger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateMap()
        locationManeger.requestWhenInUseAuthorization()
        locationManeger.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func configurateMap() {
        mapView.userTrackingMode = .follow
        mapView.delegate = self
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: -23.5489, longitude:  -46.6388)
        mapView.addAnnotation(annotation)
    }
}

extension UIViewController: MKMapViewDelegate {
    public func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
 
    }
}
