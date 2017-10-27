//
//  ViewController.swift
//  Cudate!
//
//  Created by Michael Doroff on 10/25/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import UIKit
import LBTAComponents
import FBSDKLoginKit


let FBLoginButton: FBSDKLoginButton = {
    let button = FBSDKLoginButton()
    button.readPermissions = ["email", "public_profile"]
    return button
    
}()



class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(FBLoginButton)
        
        
        
        view?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        
        FBLoginButton.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 60, rightConstant: 20, widthConstant: 20, heightConstant: 70)
        
        
    
    }

    


}

