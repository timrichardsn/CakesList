//
//  String.swift
//  CakeList
//
//  Created by Tim Richardson on 14/07/2021.
//  Copyright © 2021 Tim Richardson. All rights reserved.
//

import Foundation

extension String {
    
    var firstUppercased: String {
        if count == 0 {
            return self
        } else if count == 1 {
            return self.uppercased()
        } else {
            return prefix(1).uppercased() + dropFirst()
        }
    }
}
