//
//  BaseCell.swift
//  Cudate!
//
//  Created by Michael Doroff on 2/18/18.
//  Copyright © 2018 Michael Doroff. All rights reserved.
//


import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

