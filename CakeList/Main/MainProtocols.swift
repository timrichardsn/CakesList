//
//  MainProtocols.swift
//  CakeList
//
//  Created by Tim Richardson on 23/05/2019.
//  Copyright © 2019 Tim Richardson. All rights reserved.
//

import Foundation

// MARK: - Cake List
protocol CakeListViewProtocol: StoryboardView {
    var presenter: CakeListPresenterProtocol? { get set }
    
    func reloadData()
}

protocol CakeListPresenterProtocol: AnyObject, CakeRequestable {
    
    var view: CakeListViewProtocol? { get set }
    var coordinator: MainCoordinator? { get set }
    var model: CakeListModelProtocol! { get set }
    
    func viewDidLoad()
    func didReceiveCakes()
    func cake(at row: Int) -> Cake
    func didSelect(row: Int)
}

protocol CakeListModelProtocol: AnyObject {
    var presenter: CakeListPresenterProtocol? { get set }
    
    var cakes: [Cake] { get set }
}

// MARK: - Cake Detail
protocol CakeDetailViewProtocol: StoryboardView {
    var presenter: CakeDetailPresenterProtocol? { get set }
    func update(cake: Cake)
}

protocol CakeDetailPresenterProtocol: AnyObject {
    var view: CakeDetailViewProtocol? { get set }
    var coordinator: MainCoordinator? { get set }
    var model: CakeDetailModelProtocol { get }
    func viewDidLoad()
}

protocol CakeDetailModelProtocol {
    var cake: Cake { get }
}
