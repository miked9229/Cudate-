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

// MARRK: Firebase
class Firebase {
    
    // This class is defined to handle any calls to the Firebase application.
    // Firebase in this iOS app is used primarily for User Authentication
    // and data storage.
    //
    
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
            
            if error != nil {
                completionHandlerforLogIn(nil, error! as NSError)
           
            } else {
                
                completionHandlerforLogIn(user, nil)
                
            }
        })
        
    }
    
    public func HandleVerification(completionHandlerForVerification: @escaping(_ error: NSError?) -> Void){
        
        FIRAuth.auth()?.currentUser?.sendEmailVerification(completion: { (callbackError) in })
    }
    
    
    public func returnDataFromFirebaseForUserID() {
        
        let uid = FIRAuth.auth()!.currentUser?.uid
        print(uid)
        
        guard let userid = uid else { return }
        
        
        
    
    
    
    }
    
}
