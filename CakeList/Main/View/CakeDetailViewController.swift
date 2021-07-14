//
//  CakeDetailViewController.swift
//  CakeList
//
//  Created by Tim Richardson on 14/07/2021.
//  Copyright © 2021 Tim Richardson. All rights reserved.
//

import UIKit

class CakeDetailViewController: UIViewController, CakeDetailViewProtocol {
    
    @IBOutlet weak var cakeImageView: CakeImageView!
    @IBOutlet weak var cakeTitleLabel: UILabel!
    @IBOutlet weak var cakeDescriptionLabel: UILabel!
    
    var presenter: CakeDetailPresenterProtocol?
    
    static let storyboardIdentifier: StoryboardIdentifier = .main

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
    
    func update(cake: Cake) {
        
        cakeTitleLabel.text = cake.title
        cakeDescriptionLabel.text = cake.desc
        cakeImageView.loadImage(at: cake.imageUrl)
    }
}
