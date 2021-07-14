//
//  CakeDetailPresenter.swift
//  CakeList
//
//  Created by Tim Richardson on 14/07/2021.
//  Copyright © 2021 Tim Richardson. All rights reserved.
//

import Foundation

class CakeDetailPresenter: CakeDetailPresenterProtocol {
    
    weak var view: CakeDetailViewProtocol?
    weak var coordinator: MainCoordinator?
    
    let model: CakeDetailModelProtocol
    
    init(model: CakeDetailModelProtocol) {
        self.model = model
    }
    
    func viewDidLoad() {
        view?.update(cake: model.cake)
    }
}
