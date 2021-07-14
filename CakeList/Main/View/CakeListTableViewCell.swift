//
//  CakeListTableViewCell.swift
//  CakeList
//
//  Created by Tim Richardson on 23/05/2019.
//  Copyright © 2019 Tim Richardson. All rights reserved.
//

import UIKit

class CakeListTableViewCell: UITableViewCell, ImageDownloadable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cakeImageView: CakeImageView!
    
    override func prepareForReuse() {
        cakeImageView.reset()
    }
    
    func configure(_ cake: Cake) {
        
        titleLabel.text = cake.title.firstUppercased
        descriptionLabel.text = cake.desc.firstUppercased
        cakeImageView.loadImage(at: cake.imageUrl)
    }
}
