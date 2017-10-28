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



class LoginViewController: UIViewController {
    
    
    let inputsContainerView: UIView = {
       let view = UIView()
       view.backgroundColor = .white
       view.translatesAutoresizingMaskIntoConstraints = false
       view.layer.cornerRadius = 5
       view.layer.masksToBounds = true
       return view
        
    }()

    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
        
    }()
    
    let nameTextField: UITextField = {
       let tf = UITextField()
       tf.placeholder = "Name"
       tf.textAlignment = .center
       tf.backgroundColor = .white
       tf.borderStyle = .roundedRect
       tf.translatesAutoresizingMaskIntoConstraints = false

        return tf
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints  = false
        tf.textAlignment = .center
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        return tf
        
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment = .center
        tf.borderStyle = .roundedRect
        tf.backgroundColor  = .white
        return tf
    }()
    
    let facebookLoginButton: UIButton = {
       
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 200, g: 91, b: 151)
        button.setTitle("Login with Facebook", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let googleLoginButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 40, g: 100, b: 151)
        button.setTitle("Login with Google", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(FBLoginButton)
//        view.addSubview(GoogleSignIn)
        view?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
//        view.addSubview(inputsContainerView)
//        view.addSubview(registerButton)
//        view.addSubview(nameTextField)
        
        setUpEmailPasswordFields()
        
  
//        
//        inputsContainerView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: view.frame.height / 2, leftConstant: 12, bottomConstant: view.frame.height / 4, rightConstant: 12, widthConstant: 0, heightConstant: 0)
        
//        nameTextField.anchor(inputsContainerView.topAnchor, left: inputsContainerView.leftAnchor, bottom: nil, right: inputsContainerView.rightAnchor, topConstant: 5, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
//        registerButton.anchor(inputsContainerView.bottomAnchor, left: inputsContainerView.leftAnchor, bottom: nil, right: inputsContainerView.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
 
        
        
        
//        
//        FBLoginButton.anchor(nil, left: view.leftAnchor, bottom: GoogleSignIn.topAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 40, rightConstant: 20, widthConstant: 0, heightConstant: 70)
//        
//        GoogleSignIn.anchor(FBLoginButton.bottomAnchor, left: FBLoginButton.leftAnchor, bottom: view.bottomAnchor, right: FBLoginButton.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
//        
    
    }
    
    public func setUpEmailPasswordFields() {
        
        let nameContainerView = UIView()
//        nameContainerView.backgroundColor = .red
        nameContainerView.translatesAutoresizingMaskIntoConstraints = false
        nameContainerView.layer.cornerRadius = 5
        nameContainerView.layer.masksToBounds = true
        
        let emailContainerView = UIView()
//        emailContainerView.backgroundColor = .blue
        emailContainerView.translatesAutoresizingMaskIntoConstraints = false
        emailContainerView.layer.cornerRadius = 5
        emailContainerView.layer.masksToBounds = true
        
        let passwordContainerView = UIView()
//        passwordContainerView.backgroundColor = .black
        passwordContainerView.translatesAutoresizingMaskIntoConstraints = false
        passwordContainerView.layer.cornerRadius = 5
        passwordContainerView.layer.masksToBounds = true
        
        let loginStackView = UIStackView(arrangedSubviews: [nameContainerView, emailContainerView, passwordContainerView])
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        loginStackView.layer.cornerRadius = 5

        loginStackView.layer.masksToBounds = true
        
        loginStackView.axis = .vertical
        loginStackView.distribution = .fillEqually
        
        view.addSubview(loginStackView)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        view.addSubview(facebookLoginButton)
        view.addSubview(googleLoginButton)
        
        
        loginStackView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: view.frame.height / 2, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 0, heightConstant: 0)
        
        nameTextField.anchor(nameContainerView.topAnchor, left: nameContainerView.leftAnchor, bottom: nameContainerView.bottomAnchor, right: nameContainerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

        emailTextField.anchor(emailContainerView.topAnchor, left: emailContainerView.leftAnchor, bottom: emailContainerView.bottomAnchor, right: emailContainerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        passwordTextField.anchor(passwordContainerView.topAnchor, left: passwordContainerView.leftAnchor, bottom: passwordContainerView.bottomAnchor, right: passwordContainerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        registerButton.anchor(loginStackView.bottomAnchor, left: loginStackView.leftAnchor, bottom: nil, right: loginStackView.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        facebookLoginButton.anchor(registerButton.bottomAnchor, left: registerButton.leftAnchor, bottom: nil, right: registerButton.rightAnchor, topConstant: 30, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        googleLoginButton.anchor(facebookLoginButton.bottomAnchor, left: registerButton.leftAnchor, bottom: nil, right: registerButton.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        

        
    }

    


}

