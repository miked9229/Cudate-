//
//  MyMapViewController.swift
//  Cudate!
//
//  Created by Michael Doroff on 4/8/18.
//  Copyright © 2018 Michael Doroff. All rights reserved.
//

import UIKit
import LBTAComponents
import MapKit

class MyMapViewController: UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .blue
        navigationController?.navigationBar.backgroundColor = .black
        navigationController?.isToolbarHidden = false
        
    }
    
    let mapView: MKMapView = {
        let mapview = MKMapView()
        return mapview
        
    }()
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.addSubview(mapView)
         mapView.fillSuperview()
    }
    
}
