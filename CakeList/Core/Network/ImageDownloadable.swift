//
//  ImageDownloadable.swift
//  CakeList
//
//  Created by Tim Richardson on 20/05/2019.
//  Copyright © 2019 Tim Richardson. All rights reserved.
//

import UIKit

protocol ImageDownloadable {}

extension ImageDownloadable {
    
    /// Requests an image from a URL. Callbacks are always called on the main thread.
    func downloadImage(at url: URL, onComplete: @escaping (Result<UIImage?, Error>) -> Void) {
        
        DispatchQueue.global(qos: .background).async {
            
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                
                DispatchQueue.main.async { onComplete(.success(image)) }
            } catch {
                DispatchQueue.main.async { onComplete(.failure(error)) }
            }
        }
    }
}
