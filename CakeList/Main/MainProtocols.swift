//
//  MainProtocols.swift
//  CakeList
//
//  Created by Tim Richardson on 23/05/2019.
//  Copyright © 2019 Tim Richardson. All rights reserved.
//

import Foundation

protocol CakeListViewProtocol: StoryboardView {
    var presenter: CakeListPresenterProtocol? { get set }
    
    func reloadData()
}

protocol CakeListPresenterProtocol: class, CakeRequestable {
    
    var view: CakeListViewProtocol? { get set }
    var coordinator: MainCoordinator? { get set }
    var model: CakeListModelProtocol! { get set }
    
    func viewDidLoad()
    func didReceiveCakes()
    func cake(at row: Int) -> Cake
}

protocol CakeListModelProtocol: class {
    var presenter: CakeListPresenterProtocol? { get set }
    
    var cakes: [Cake] { get set }
}
