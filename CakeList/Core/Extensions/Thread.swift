//
//  Thread.swift
//  CakeList
//
//  Created by Tim Richardson on 23/05/2019.
//  Copyright © 2019 Tim Richardson. All rights reserved.
//

import Foundation

extension Thread {
    
    static func executeOnMain(_ block: @escaping () -> Void) {
        if isMainThread {
            block()
        } else {
            DispatchQueue.main.async(execute: block)
        }
    }
}
