//
//  UICollectionView.swift
//  Cudate!
//
//  Created by Michael Doroff on 3/12/18.
//  Copyright © 2018 Michael Doroff. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func deselectAllItems(animated: Bool = false) {
        print(self.indexPathsForSelectedItems)
        for indexPath in self.indexPathsForSelectedItems ?? [] {
            self.deselectItem(at: indexPath, animated: animated)
        }
    }
}
