//
//  Cake.swift
//  CakeList
//
//  Created by Tim Richardson on 23/05/2019.
//  Copyright © 2019 Tim Richardson. All rights reserved.
//

import Foundation

struct Cake {
    
    let title: String
    let desc: String
    let imageUrlString: String
    
    var imageUrl: URL? {
        return URL(string: imageUrlString)
    }
}
