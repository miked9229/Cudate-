//
//  CustomButtons.swift
//  Cudate!
//
//  Created by Michael Doroff on 10/26/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import UIKit
import LBTAComponents
import FBSDKLoginKit
import GoogleSignIn


let FBLoginButton: FBSDKLoginButton = {
    let FBbutton = FBSDKLoginButton()
    FBbutton.translatesAutoresizingMaskIntoConstraints = false
    FBbutton.readPermissions = ["email", "public_profile"]
    return FBbutton
    
}()

let GoogleSignIn: GIDSignInButton = {
    let Googlebutton = GIDSignInButton()
    Googlebutton.translatesAutoresizingMaskIntoConstraints = false
    return Googlebutton
    
}()






