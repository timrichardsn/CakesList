//
//  CakeRequestable.swift
//  CakeList
//
//  Created by Tim Richardson on 23/05/2019.
//  Copyright © 2019 Tim Richardson. All rights reserved.
//

import Foundation

protocol CakeRequestable {
    func getCakes(onComplete: @escaping (Result<[Cake], Error>) -> Void)
}

extension CakeRequestable {
    
    /// Requests cakes from the server. Callbacks are called on the main thread.
    func getCakes(onComplete: @escaping (Result<[Cake], Error>) -> Void) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "gist.githubusercontent.com"
        urlComponents.path = "/hart88/79a65d27f52cbb74db7df1d200c4212b/raw/ebf57198c7490e42581508f4f40da88b16d784ba/cakeList"
        
        guard let url = urlComponents.url else {
            Thread.executeOnMain { onComplete(.failure(NetworkError.unableToBuildUrl)) }
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            
            do {
                let data = try Data(contentsOf: url)
                
                guard let cakes = try? JSONDecoder().decode([CakeResponse].self, from: data) else {
                    DispatchQueue.main.async { onComplete(.failure(NetworkError.invalidJsonFormat)) }
                    return
                }
                
                let cakesList = cakes.compactMap { $0.cake }
                DispatchQueue.main.async { onComplete(.success(cakesList)) }
                
            } catch {
                
                DispatchQueue.main.async { onComplete(.failure(error)) }
            }
        }
    }
    
}

private struct CakeResponse: Decodable {
    
    var title: String?
    var desc: String?
    var image: String?
    
    var cake: Cake? {
        guard let title = title, let desc = desc, let image = image else { return nil }
        return Cake(title: title, desc: desc, imageUrlString: image)
    }
}
