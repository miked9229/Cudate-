//
//  FirebaseNetworking.swift
//  Cudate!
//
//  Created by Michael Doroff on 11/1/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import Foundation
import FirebaseAuth
import UIKit



class Firebase {
    
    
    public func registerUserUsingEmailAndPassword(email: UITextField, password: UITextField, completionHandlerForRegistration: @escaping(_ user: FIRUser?, _ error: NSError?) -> Void) {
        
        guard let email = email.text, let password = password.text else { return }
    
   
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                completionHandlerForRegistration(nil, error! as NSError)
            } else {
                completionHandlerForRegistration(user, nil)
            }
            
        })
    
    }
    
    
    public func loginUserUsingEmailAndPassword(email: UITextField, password: UITextField, completionHandlerforLogIn: @escaping(_ user: FIRUser?, _ error: NSError?) -> Void) {
        
        guard let email = email.text, let password = password.text else { return }
        
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            print(user)
            print(error)
            
            
            if error != nil {
                completionHandlerforLogIn(nil, error! as NSError)
           
            }
        
            
            completionHandlerforLogIn(user, nil)
        })
        
    }
    
    
    
}
