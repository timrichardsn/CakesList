//
//  ImageCache.swift
//  CakeList
//
//  Created by Tim Richardson on 23/05/2019.
//  Copyright © 2019 Tim Richardson. All rights reserved.
//

import UIKit

class ImageCache: ImageDownloadable {
    
    static let shared = ImageCache()
    
    let cakeImageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.name = "cakeImageCache"
        return cache
    }()
    
    func image(for url: URL, onComplete: @escaping (Result<UIImage?, Error>) -> Void) {
        
        if let cachedImage = cakeImageCache.object(forKey: url.absoluteString as NSString) {
            onComplete(.success(cachedImage))
            return
        }
        
        downloadImage(at: url) { [weak self] result in
            
            switch result {
            case .success(let image):
                
                if let image = image {
                    self?.cakeImageCache.setObject(image, forKey: url.absoluteString as NSString)
                }
                
                onComplete(.success(image))
                
            case .failure(let error):
                onComplete(.failure(error))
            }
        }
    }
}
