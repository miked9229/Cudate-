//
//  TabBarViewController.swift
//  Cudate!
//
//  Created by Michael Doroff on 11/5/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import UIKit
import Firebase


class TabBarViewController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        
        view.backgroundColor = .blue
     
        print("Tab Bar ViewController being called")
    
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logOut))
        
    
        if FIRAuth.auth()?.currentUser?.uid != nil {
            logOut()
            
        }
    
    
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
