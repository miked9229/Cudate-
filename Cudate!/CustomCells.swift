//
//  CustomCells.swift
//  Cudate!
//
//  Created by Michael Doroff on 2/25/18.
//  Copyright © 2018 Michael Doroff. All rights reserved.
//

import Foundation
import LBTAComponents


class CollectionViewHeader: DatasourceCell {
    
    let profileName: UILabel = {
       let label = UILabel()
       return label
    }()
    
    
    override func setupViews() {
        
        backgroundColor = .white
        separatorLineView.isHidden = false
        addSubview(profileName)
        
        profileName.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
    }
    
}
