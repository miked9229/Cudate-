//
//  TabBarViewController.swift
//  Cudate!
//
//  Created by Michael Doroff on 11/5/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import UIKit


class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        print("Tab Bar ViewController being called")
    
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logOut))
        
    }
    
    
    public func logOut() {
        
        let loginViewController = LoginViewController()
        present(loginViewController, animated: true, completion: nil)
    
    }
    
    }
