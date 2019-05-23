//
//  NetworkError.swift
//  CakeList
//
//  Created by Tim Richardson on 23/05/2019.
//  Copyright © 2019 Tim Richardson. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case unableToBuildUrl, invalidJsonFormat
}
