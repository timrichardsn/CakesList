//
//  CakeListPresenter.swift
//  CakeList
//
//  Created by Tim Richardson on 23/05/2019.
//  Copyright © 2019 Tim Richardson. All rights reserved.
//

import UIKit

class CakeListPresenter: CakeListPresenterProtocol {
    
    weak var view: CakeListViewProtocol?
    weak var coordinator: MainCoordinator?
    var model: CakeListModelProtocol!
    
    func viewDidLoad() {
        
        getCakes(onSuccess: { [weak self] cakes in
            self?.model.cakes = cakes
        }) { error in
            // handle the error appropriately
        }
    }
    
    func cake(at row: Int) -> Cake {
        return model.cakes[row]
    }
    
    func didReceiveCakes() {
        view?.reloadData()
    }
}
