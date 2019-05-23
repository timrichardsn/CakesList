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
    
    func image(for url: URL, onSuccess: @escaping (UIImage?) -> Void, onError: @escaping (Error?) -> Void) {
        
        if let cachedImage = cakeImageCache.object(forKey: url.absoluteString  as NSString) {
            onSuccess(cachedImage)
            return
        }
        
        downloadImage(at: url, onSuccess: { [weak self] image in
            
            if let image = image {
                self?.cakeImageCache.setObject(image, forKey: url.absoluteString as NSString)
            }
            
            onSuccess(image)
            
        }) { error in
            
            onError(error)
        }
    }
}
