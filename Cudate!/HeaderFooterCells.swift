//
//  HeaderFooterCells.swift
//  
//
//  Created by Michael Doroff on 3/3/18.
//

import Foundation
import LBTAComponents

class UserHeader: DatasourceCell {
    
    
    override func setupViews() {
        super.setupViews()
        
    }
    
}

class UserFooter: DatasourceCell {
    

    override func setupViews() {
        super.setupViews()
        
        let whiteBackgroundView = UIView()
        whiteBackgroundView.backgroundColor = .white
        
        addSubview(whiteBackgroundView)
    
    }
}


