//
//  HelperMethods.swift
//  Cudate!
//
//  Created by Michael Doroff on 12/17/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import UIKit


class LeftMenuLauncher: NSObject {
    
    let blackView = UIView()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    let menuItems = ["Your Profile"]
    let cellid = "cellid"
    let cellHeight: CGFloat = 50
    
    @objc public func showMenu() {
        if let window = UIApplication.shared.keyWindow {
            
            let x = (window.frame.width - window.frame.width / 3)
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            window.addSubview(blackView)
            window.addSubview(collectionView)
            
            let point = CGPoint(x: 0, y: 0)
            let size = CGSize(width: x, height: window.frame.height)
            
            collectionView.frame = CGRect(origin: point, size: size)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.collectionView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height))
            }, completion: nil)
            
        }
 
        
    }
    @objc public func handleDismiss() {
       
        print("Handle Dismiss called")
        UIView.animate(withDuration: 0.05) {
            self.blackView.alpha = 0
            if let _ = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(origin: CGPoint(x: -self.collectionView.frame.width, y: 0), size: CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height))
                
            }
        }
        
    }

    override init() {
        super.init()
    }
}
