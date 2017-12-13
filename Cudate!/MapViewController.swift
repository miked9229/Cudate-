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
    
    var menuShowing = false
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
    

    let slideOutView: UIView = {
        let slideView = UIView()
        slideView.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        slideView.translatesAutoresizingMaskIntoConstraints = false
        slideView.layer.cornerRadius = 5
        slideView.layer.masksToBounds = true
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondtoSwipeGesture))
        swipeLeft.direction = .left
        slideView.addGestureRecognizer(swipeLeft)

        return slideView
        
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
    
    public func slideOutMenu() {
        
        leftAnchor?.isActive = false
        leftAnchor = slideOutView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
        leftAnchor?.isActive = true
//        slideOutView.superview?.bringSubview(toFront: slideOutView)
        
        UIView.animate(withDuration: 0.5, animations: { 
            
            self.view.layoutIfNeeded()
            
            
        }, completion: nil)
        
    }
    
    public func respondtoSwipeGesture() {
        
        print("Trying my best to swipe....")
        
        slideOutView.backgroundColor = .red

        
        
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
        
        if FIRAuth.auth()?.currentUser?.uid == nil {
            logOut()
            
        }
        

        
        view.addSubview(mapView)
        mapView.fillSuperview()
        view.addSubview(slideOutView)
        view.addSubview(menuButton)
        view.addSubview(backButtonView)
        
        menuButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 55)
    
        leftAnchor = slideOutView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -view.frame.width / 2)
        
        leftAnchor?.isActive = true
        
        slideOutView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        slideOutView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        slideOutView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        slideOutView.widthAnchor.constraint(equalToConstant: view.frame.width / 2).isActive = true
        
        
        backButtonView.anchor(slideOutView.topAnchor, left: nil, bottom: nil, right: slideOutView.rightAnchor, topConstant: 4, leftConstant: 0, bottomConstant: 0, rightConstant: 4, widthConstant: 10, heightConstant: 10)
        
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

//MARK: MapViewController: CLLocationManagerDelegate

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        
        print("didUpdateLocation is being called")
        let location = locations[0]
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        
        let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude,  location.coordinate.longitude)
        
        let region = MKCoordinateRegionMake(myLocation, span)
        
        
        mapView.setRegion(region, animated: true)
        
        mapView.showsUserLocation = true
        
        
        manager.stopUpdatingLocation()
        
    }
    

}
