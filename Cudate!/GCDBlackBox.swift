//
//  GCDBlackBox.swift
//  Cudate!
//
//  Created by Michael Doroff on 12/2/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import Foundation


func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}
