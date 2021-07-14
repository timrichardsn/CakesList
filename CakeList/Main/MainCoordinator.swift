//
//  MainCoordinator.swift
//  CakeList
//
//  Created by Tim Richardson on 23/05/2019.
//  Copyright © 2019 Tim Richardson. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let view = CakeListTableViewController.instantiate()
        let presenter: CakeListPresenterProtocol = CakeListPresenter()
        let model: CakeListModelProtocol = CakeListModel()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.coordinator = self
        presenter.model = model
        
        model.presenter = presenter
        
        navigationController.pushViewController(view, animated: false)
    }
    
    func showDetail(for cake: Cake) {
        
        let view = CakeDetailViewController.instantiate()
        let model: CakeDetailModelProtocol = CakeDetailModel(cake: cake)
        let presenter: CakeDetailPresenterProtocol = CakeDetailPresenter(model: model)
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.coordinator = self
        
        navigationController.pushViewController(view, animated: true)
    }
}
