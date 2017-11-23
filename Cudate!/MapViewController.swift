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
    
    var menuShowing = false
    var leftAnchor: NSLayoutConstraint?
    
 
    let mapView: MKMapView = {
       let mapview = MKMapView()
       return mapview
        
    }()
    
    let slideOutView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
        
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
        slideOutView.superview?.bringSubview(toFront: slideOutView)
        
        UIView.animate(withDuration: 0.5, animations: { 
            
            self.view.layoutIfNeeded()
            
            
        }, completion: nil)
        
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
        
        
        menuButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 55)
        
        
        leftAnchor = slideOutView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -view.frame.width / 2)
        
        leftAnchor?.isActive = true
        
        slideOutView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        slideOutView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        slideOutView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        slideOutView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        slideOutView.widthAnchor.constraint(equalToConstant: view.frame.width / 2).isActive = true
        
        
    
     
        

    
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
