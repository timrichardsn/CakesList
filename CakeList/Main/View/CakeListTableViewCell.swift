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
    @IBOutlet weak var cakeImageView: UIImageView!
    
    /// Used to store the image url associated with the image of the Cake we're displaying in this cell
    private var imageUrlString: String?
    
    func configure(_ cake: Cake) {
        
        titleLabel.text = cake.title
        descriptionLabel.text = cake.desc
        imageUrlString = cake.imageUrlString
        
        cakeImageView.image = .placeholder
        
        if let imageUrl = cake.imageUrl {
            ImageCache.shared.image(for: imageUrl, onSuccess: { [weak self] image in
                self?.set(image: image, forImageUrl: cake.imageUrlString)
            }) { (error) in
                // handle the error (for now, nothing to do here since we set the image to a placeholder before the request anyway)
            }
        }
    }
    
    private func set(image: UIImage?, forImageUrl imageUrl: String) {
        // only allow the image to be set if the image url for the given image matches the one currently assigned to this cell
        guard imageUrlString == imageUrl else {
            return
        }
        cakeImageView.image = image ?? .placeholder
    }
}

private extension UIImage {
    
    static var placeholder: UIImage? {
        return UIImage(named: "placeholder")
    }
}
