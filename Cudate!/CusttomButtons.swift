//
//  ButtonsFromAPIs.swift
//  Cudate!
//
//  Created by Michael Doroff on 11/25/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import Foundation
import UIKit
import FBSDKLoginKit
import GoogleSignIn



let facebookLoginButton: UIButton = {
    
    let button = UIButton(type: .system)
    button.backgroundColor = UIColor(r: 49, g: 100, b: 173)
    button.setTitle("Login with Facebook", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 5
    button.layer.masksToBounds = true
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
}()

let googleLoginButton: UIButton = {
    
    let button = UIButton(type: .system)
    button.backgroundColor = UIColor(r: 247, g: 66, b: 56)
    button.setTitle("Login with Google", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 5
    button.layer.masksToBounds = true
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
}()

let guestLoginButton: UIButton = {
    
    let button = UIButton(type: .system)
    button.backgroundColor = UIColor(r: 40, g: 100, b: 151)
    button.setTitle("Login as Guest", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 5
    button.layer.masksToBounds = true
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
}()


