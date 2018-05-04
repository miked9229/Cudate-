//
//  HelperMethods.swift
//  Cudate!
//
//  Created by Michael Doroff on 12/17/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.


import UIKit
import LBTAComponents


//MARK: LeftMenuLauncher: NSObject

class LeftMenuLauncher: NSObject {
   
    let blackView = UIView()

    let cellid = "cellid"
    let headerId = "headerID"
    let footerid = "footerID"
    let headerHeight: CGFloat = 50
    let footerHeight: CGFloat = 50
    let window = UIApplication.shared.keyWindow

    let settings: [Setting] = {
        
        return [Setting(name: "My Profile"),Setting(name: "My Map"), Setting(name: "My Places")]
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(r: 192, g: 192, b: 192)
        return cv
    }()

    let chooserButton: UIButton = {
       let button = UIButton()
       return button
    }()
    
    @objc public func showMenu() {
        if let window = UIApplication.shared.keyWindow {
            
            let x = (window.frame.width - window.frame.width / 3)
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            window.addSubview(blackView)
            window.addSubview(collectionView)

            collectionView.deselectAllItems()
      
            let point = CGPoint(x: 0, y: 0)
            let size = CGSize(width: x, height: window.frame.height)
            
            collectionView.frame = CGRect(origin: point, size: size)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.05, delay: 0.05, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.blackView.alpha = 1

                NSLayoutConstraint.activate([
                    
                    self.collectionView.topAnchor.constraint(equalTo: window.topAnchor),
                    self.collectionView.leadingAnchor.constraint(equalTo: window.leadingAnchor),
                    self.collectionView.trailingAnchor.constraint(equalTo: window.trailingAnchor, constant: -x)
                    
                    ])
                
            }, completion: nil)
        
        }
    }
    
    @objc public func handleDismiss() {
       
        UIView.animate(withDuration: 0.01) {
            self.blackView.alpha = 0
            if let _ = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(origin: CGPoint(x: -self.collectionView.frame.width, y: 0), size: CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height))

            }
        }
    }

    override init() {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(SettingCell.self, forCellWithReuseIdentifier: cellid)
        collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerid)
    }
}


//MARK: LeftMenuLauncher: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension LeftMenuLauncher: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! SettingCell
        
        let setting = settings[indexPath.item]
        cell.setting = setting
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 1 {
            return .zero
        }
        return CGSize(width: collectionView.frame.width, height: headerHeight)
        
    }
    

    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
            header.backgroundColor = .gray
            return header
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
    
        let extraSpace: CGFloat = (window!.frame.height * 0.60) / CGFloat(settings.count)
        print(extraSpace)
        let spaceForHeader = headerHeight / CGFloat(settings.count)
        let spaceForFooter = footerHeight / CGFloat(settings.count)
        let totalSpaceExtra = spaceForHeader + spaceForFooter + extraSpace
        
        let totalSizeBeforeHeaderAndFooter = (collectionView.frame.height /  CGFloat(settings.count))
        
        let totalSizeAfterHeaderAndExtraSpace: CGFloat = (totalSizeBeforeHeaderAndFooter - totalSpaceExtra)
        
        return CGSize(width: collectionView.frame.width, height: totalSizeAfterHeaderAndExtraSpace)
            

    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = indexPath.item
        
        InstantiateMenuBasedOnIndexPath(item: item)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor(r: 192, g: 192, b: 192)
    }
    
    private func InstantiateMenuBasedOnIndexPath(item: Int) {
        
        var VCDictionary = [0: MyProfileViewController(), 1: MyMapViewController(),
                            2: MyFavoritePlacesViewController()]
        
        switch item {
            
                case 0:
                    
                    if let window = UIApplication.shared.keyWindow {
                        handleDismiss()
                        let vc = VCDictionary[item]
                        let rootVC = window.rootViewController as! UINavigationController
                        rootVC.pushViewController(vc!, animated: true)
                    }
            
                case 1:
                    if let window = UIApplication.shared.keyWindow {
                        handleDismiss()
                        let vc = VCDictionary[item]
                        let rootVC = window.rootViewController as! UINavigationController
                        rootVC.pushViewController(vc!, animated: true)
                        
                    }
            
                case 2:
            
                    if let window = UIApplication.shared.keyWindow {
                        handleDismiss()
                        let vc = VCDictionary[item]
                        let rootVC = window.rootViewController as! UINavigationController
                        rootVC.pushViewController(vc!, animated: true)
                        
                }
            
                default:
            
                    print("There was an error")
            
        }
    }
}
