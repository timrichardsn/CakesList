//
//  CakeRequestable.swift
//  CakeList
//
//  Created by Tim Richardson on 23/05/2019.
//  Copyright © 2019 Tim Richardson. All rights reserved.
//

import Foundation

protocol CakeRequestable {
    func getCakes(onSuccess: @escaping ([Cake]) -> Void, onError: @escaping (Error) -> Void)
}

extension CakeRequestable {
    
    /// Requests cakes from the server. Callbacks are called on the main thread.
    func getCakes(onSuccess: @escaping ([Cake]) -> Void, onError: @escaping (Error) -> Void) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "gist.githubusercontent.com"
        urlComponents.path = "/hart88/198f29ec5114a3ec3460/raw/8dd19a88f9b8d24c23d9960f3300d0c917a4f07c/cake.json"
        
        guard let url = urlComponents.url else {
            Thread.executeOnMain {
                onError(NetworkError.unableToBuildUrl)
            }
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            
            do {
                let data = try Data(contentsOf: url)
                
                guard let cakes = try? JSONDecoder().decode([CakeResponse].self, from: data) else {
                    DispatchQueue.main.async {
                        onError(NetworkError.invalidJsonFormat)
                    }
                    return
                }
                
                let cakesList = cakes.compactMap { $0.cake }
                DispatchQueue.main.async {
                    onSuccess(cakesList)
                }
                
            } catch {
                
                DispatchQueue.main.async {
                    onError(error)
                }
            }
        }
    }
    
}

private struct CakeResponse: Decodable {
    
    var title: String?
    var desc: String?
    var image: String?
    
    var cake: Cake? {
        guard let title = title, let desc = desc, let image = image else {
            return nil
        }
        return Cake(title: title, desc: desc, imageUrlString: image)
    }
}
