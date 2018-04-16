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
import CoreLocation

class MapViewController: UIViewController  {

    var leftAnchor: NSLayoutConstraint?
    let manager = CLLocationManager()
   
    let mapView: MKMapView = {
       let mapview = MKMapView()
       return mapview
        
    }()
    
    let backButtonView: UIButton = {
        let backButton = UIButton()
        backButton.setTitle("Back", for: .normal)
        backButton.superview?.bringSubview(toFront: backButton)
        return backButton
        
    }()
    
    let menuButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 40, g: 100, b: 151)
        button.setTitle("Menu", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(slideOutMenu), for: .touchUpInside)
        return button
   
    }()
    
    let leftMenuLauncher = LeftMenuLauncher()
    
    public func slideOutMenu() {

        leftMenuLauncher.showMenu()
    
    }
    
    override func viewDidLoad() {
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyKilometer
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.isToolbarHidden = true
        
        if FIRAuth.auth()?.currentUser?.uid == nil {
            logOut()
            
        }
        
        view.addSubview(mapView)
        mapView.fillSuperview()
        view.addSubview(menuButton)
        view.addSubview(backButtonView)
        view.addSubview(searchField)

        menuButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 55)
        
        searchField.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor,
                           leftConstant: 20, bottomConstant: 50, rightConstant: 20, widthConstant: 100, heightConstant: 40)
    
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
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
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}



//MARK: MapViewController: CLLocationManagerDelegate

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        
        let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude,  location.coordinate.longitude)
        
        let region = MKCoordinateRegionMake(myLocation, span)
        
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        manager.stopUpdatingLocation()
        
    }
}
