//
//  CustomTextFields.swift
//  Cudate!
//
//  Created by Michael Doroff on 11/25/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import Foundation
import UIKit



let nameTextField: UITextField = {
    let tf = UITextField()
    tf.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSForegroundColorAttributeName: UIColor.black])
    tf.textAlignment = .center
    tf.backgroundColor = .white
    tf.borderStyle = .roundedRect
    tf.translatesAutoresizingMaskIntoConstraints = false
    
    return tf
}()

let emailTextField: UITextField = {
    let tf = UITextField()
    tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSForegroundColorAttributeName: UIColor.black])
    tf.translatesAutoresizingMaskIntoConstraints  = false
    tf.textAlignment = .center
    tf.borderStyle = .roundedRect
    tf.backgroundColor = .white
    return tf
    
}()

let passwordTextField: UITextField = {
    let tf = UITextField()
    tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: UIColor.black])
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.textAlignment = .center
    tf.borderStyle = .roundedRect
    tf.isSecureTextEntry = true
    tf.backgroundColor  = .white
    
    return tf
}()

