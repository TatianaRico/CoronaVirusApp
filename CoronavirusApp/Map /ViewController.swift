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
    
    // MARK: - IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Properties
    lazy var locationManeger = CLLocationManager()
    var controller = MapController()
    var viewController: String?
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManeger.requestWhenInUseAuthorization()
        controller.getAPIMap(country: viewController ?? "", completion: { (sucess) in
            if sucess {
                self.configurateMap()
            }
        })}
    
    // MARK: Methods
    func configurateMap() {
        var coordination =  CLLocationCoordinate2D(latitude: controller.latitude(), longitude: controller.longitude())
        let direction = MKCoordinateRegion(center: coordination, latitudinalMeters: 1000, longitudinalMeters: 1000)
        self.mapView.setRegion(direction, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordination
        mapView.addAnnotation(annotation)
    }
}

