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
import FirebaseAuth

class LoginViewController: UIViewController {
    
    let loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleRegisterOrLogin), for: .touchUpInside)
        return button
        
    }()

    func handleRegisterOrLogin(segmentedControl: UISegmentedControl ) {
        
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            
        Firebase().loginUserUsingEmailAndPassword(email: emailTextField, password: passwordTextField, completionHandlerforLogIn: { (user, error) in
 
            if let error = error {
                
                self.clearUserNameAndPasswordFields()
                
                performUIUpdatesOnMain {
                    
                    self.raiseMessageToUser(message: error.localizedDescription)
                    
                }
            }
            else {
                
                self.navigationController?.pushViewController(MapViewController(), animated: true)
            }
        })
    }
        else {
            Firebase().registerUserUsingEmailAndPassword(email: emailTextField, password: passwordTextField) { (user, error) in
                
                if let error = error {
                    
                    print(error)
                    
                    self.clearUserNameAndPasswordFields()
                    
                    performUIUpdatesOnMain {
                        
                        self.raiseMessageToUser(message: error.localizedDescription)
                        
                    }
            
                }
                else {
                    Firebase().HandleVerification(completionHandlerForVerification: { (error) in
                        
                    })
                    
                }
            }
            
        }
    
    }
    
    lazy var loginRegisterSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Login", "Register"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = .blue
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        return sc
        
        
    }()
    
    public func raiseMessageToUser(message: String) {
        
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
    func handleLoginRegisterChange() {
        
        nameTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
        
        let title = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)
        loginRegisterButton.setTitle(title, for: .normal)

        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            
            nameTextField.isHidden = true
            facebookLoginButton.isHidden = false
            googleLoginButton.isHidden = false
            guestLoginButton.isHidden = false
            
        } else {
            
            nameTextField.isHidden = false
            facebookLoginButton.isHidden = true
            googleLoginButton.isHidden = true
            guestLoginButton.isHidden = true
           
        }
        
    }
    
    
    public func clearUserNameAndPasswordFields() {
        
        nameTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkIfDeviceIsAlreadyLoggedIn()
        subscribeToKeyboardNotifications()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        checkIfDeviceIsAlreadyLoggedIn()
        loginRegisterButton.setTitle("Login", for: .normal  )
        nameTextField.isHidden = true
        setUpEmailPasswordFields()
    
        nameTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.delegate = self
        

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    public func setUpEmailPasswordFields() {
        
        let nameContainerView = UIView()
        nameContainerView.translatesAutoresizingMaskIntoConstraints = false
        nameContainerView.layer.cornerRadius = 5
        nameContainerView.layer.masksToBounds = true
        
        let emailContainerView = UIView()
        emailContainerView.translatesAutoresizingMaskIntoConstraints = false
        emailContainerView.layer.cornerRadius = 5
        emailContainerView.layer.masksToBounds = true
        
        let passwordContainerView = UIView()
        passwordContainerView.translatesAutoresizingMaskIntoConstraints = false
        passwordContainerView.layer.cornerRadius = 5
        passwordContainerView.layer.masksToBounds = true
        
        let loginStackView = UIStackView(arrangedSubviews: [nameContainerView, emailContainerView, passwordContainerView])
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        loginStackView.layer.cornerRadius = 5

        loginStackView.layer.masksToBounds = true
        
        loginStackView.axis = .vertical
        loginStackView.distribution = .fillEqually
        
        view.addSubview(loginRegisterSegmentedControl)
        view.addSubview(loginStackView)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginRegisterButton)
        view.addSubview(facebookLoginButton)
        view.addSubview(googleLoginButton)
        view.addSubview(guestLoginButton)
        
        
        loginRegisterSegmentedControl.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: view.frame.height / 2 , leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 0, heightConstant: 0)
        
        loginStackView.anchor(loginRegisterSegmentedControl.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 15, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 0, heightConstant: 0)
        
        nameTextField.anchor(nameContainerView.topAnchor, left: nameContainerView.leftAnchor, bottom: nameContainerView.bottomAnchor, right: nameContainerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

        emailTextField.anchor(emailContainerView.topAnchor, left: emailContainerView.leftAnchor, bottom: emailContainerView.bottomAnchor, right: emailContainerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        passwordTextField.anchor(passwordContainerView.topAnchor, left: passwordContainerView.leftAnchor, bottom: passwordContainerView.bottomAnchor, right: passwordContainerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        loginRegisterButton.anchor(loginStackView.bottomAnchor, left: loginStackView.leftAnchor, bottom: nil, right: loginStackView.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        facebookLoginButton.anchor(loginRegisterButton.bottomAnchor, left: loginRegisterButton.leftAnchor, bottom: nil, right: loginRegisterButton.rightAnchor, topConstant: 15, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        googleLoginButton.anchor(facebookLoginButton.bottomAnchor, left: loginRegisterButton.leftAnchor, bottom: nil, right: loginRegisterButton.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
        guestLoginButton.anchor(googleLoginButton.bottomAnchor, left: loginRegisterButton.leftAnchor, bottom: view.bottomAnchor, right: loginRegisterButton.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    
    }
    
    public func checkIfDeviceIsAlreadyLoggedIn() {
    
        if FIRAuth.auth()?.currentUser?.uid != nil {
            
            navigationController?.pushViewController(MapViewController(), animated: true)
            
        }
        
    }

}

//MARK LoginViewController: UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func keyboardWillShow(_ notification:Notification) {
        
        view.frame.origin.y = -(getKeyboardHeight(notification: notification))
        
    }
    
    func keyboardWillHide(_ notification: Notification) {
        
        view.frame.origin.y = 0

    }
    
    func getKeyboardHeight(notification: Notification) -> CGFloat {
        /* This function returns the height of the keyboard and it is called in the
         above methods keyboardWillShow() and keyboardWillHide() */
        
        let userinfo = notification.userInfo
        let keyboardSize = userinfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
        
    }
    
    func subscribeToKeyboardNotifications()  {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    
    func unsubscribeToKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    
}


