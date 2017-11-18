//
//  MapViewController.swift
//  Cudate!
//
//  Created by Michael Doroff on 11/6/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import UIKit
import MapKit
import LBTAComponents
import Firebase


class MapViewController: UIViewController {
    

    let mapView: MKMapView = {
       let mapview = MKMapView()
       return mapview
        
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white
        
        print( FIRAuth.auth()?.currentUser?.uid)
        
        if FIRAuth.auth()?.currentUser?.uid == nil {
            logOut()
            
        }
        
        
        view.addSubview(mapView)
        
        
        
        
        
        
        mapView.fillSuperview()
        
  
    }
    
    
    public func logOut() {
        
        
        do {
            try FIRAuth.auth()?.signOut()
        } catch let err {
            print(err)
        }
        
        
        
        let loginViewController = LoginViewController()
        
        
        self.navigationController?.pushViewController(loginViewController, animated: true)
        
        
    }
    
}
