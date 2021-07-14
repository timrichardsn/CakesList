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
        
        getCakes { [weak self] result in
            
            switch result {
            case .success(let cakes):
                self?.model.cakes = cakes
            case .failure:
                // handle the error appropriately
                break
            }
        }
    }
    
    func cake(at row: Int) -> Cake {
        model.cakes[row]
    }
    
    func didReceiveCakes() {
        view?.reloadData()
    }
    
    func didSelect(row: Int) {
        coordinator?.showDetail(for: cake(at: row))
    }
}
