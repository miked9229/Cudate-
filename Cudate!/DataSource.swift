//
//  DataSource.swift
//  Cudate!
//
//  Created by Michael Doroff on 3/3/18.
//  Copyright © 2018 Michael Doroff. All rights reserved.
//

import Foundation
import LBTAComponents


class HomeDatasource: Datasource {
    
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    

    override func cellClasses() -> [DatasourceCell.Type] {
        return []
    }


    override func numberOfItems(_ section: Int) -> Int {
        return 0
    }

    override func item(_ indexPath: IndexPath) -> Any? {
    
        return []
    }

    override func numberOfSections() -> Int {
        return 0
        
    }

}
    

