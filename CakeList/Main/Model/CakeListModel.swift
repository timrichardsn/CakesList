//
//  CakeListModel.swift
//  CakeList
//
//  Created by Tim Richardson on 23/05/2019.
//  Copyright © 2019 Tim Richardson. All rights reserved.
//

import Foundation

class CakeListModel: CakeListModelProtocol {
    
    weak var presenter: CakeListPresenterProtocol?
    
    var cakes: [Cake] = [] {
        didSet { presenter?.didReceiveCakes() }
    }
}
