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
    var controller = MapController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateMap()
        locationManeger.requestWhenInUseAuthorization()
        locationManeger.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func configurateMap() {
        var coordination =  CLLocationCoordinate2D(latitude: Double(controller.latitude()), longitude: Double( controller.longitude()))
        
        controller.getAPIMap { (sucess) in
            let direction = MKCoordinateRegion(center: coordination, latitudinalMeters: 1000, longitudinalMeters: 1000)
            self.mapView.setRegion(direction, animated: true)
        }
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordination
        mapView.addAnnotation(annotation)
    }
}

extension UIViewController: MKMapViewDelegate {
    public func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
    }
}
