//
//  CakeImageView.swift
//  CakeList
//
//  Created by Tim Richardson on 14/07/2021.
//  Copyright © 2021 Tim Richardson. All rights reserved.
//

import UIKit

class CakeImageView: UIView {
    
    let imageView: UIImageView
    let activityIndicator: UIActivityIndicatorView
    
    required init?(coder: NSCoder) {
        
        imageView = UIImageView(frame: .zero)
        activityIndicator = UIActivityIndicatorView(style: .medium)
        
        super.init(coder: coder)
        
        clipsToBounds = true
        backgroundColor = .lightGray
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
        
        addSubview(imageView)
        addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func reset() {
        imageView.image = nil
    }
    
    func loadImage(at url: URL?) {
        
        guard let url = url else {
            imageView.image = .placeholder
            return
        }
        
        activityIndicator.startAnimating()
        
        ImageCache.shared.image(for: url) { [weak self] result in
            
            defer { self?.activityIndicator.stopAnimating() }
            
            switch result {
            case .success(let image):
                self?.imageView.image = image ?? .placeholder
            case .failure:
                self?.imageView.image = .placeholder
            }
        }
    }
}

private extension UIImage {
    
    static var placeholder: UIImage? { UIImage(named: "placeholder") }
}
