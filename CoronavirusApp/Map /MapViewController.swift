//
//  ViewController.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 30/05/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Properties
    lazy var locationManeger = CLLocationManager()
    var controller = MapController()
    var country: String?
    weak var coordinator: MapCoordinator?
    
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManeger.requestWhenInUseAuthorization()
        controller.getAPIMap(country: country ?? "", completion: { (sucess) in
            if sucess {
                self.configurateMap()
            }
        })}
   
    deinit {
           coordinator?.childDidFinish(coordinator)
           print("MapViewController deinit")
       }
    
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

