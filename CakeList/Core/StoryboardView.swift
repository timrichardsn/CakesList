//
//  StoryboardView.swift
//  CakeList
//
//  Created by Tim Richardson on 23/05/2019.
//  Copyright © 2019 Tim Richardson. All rights reserved.
//

import Foundation
import UIKit

enum StoryboardIdentifier {
    case main
    
    var storyboard: UIStoryboard {
        switch self {
        case .main: return UIStoryboard(name: "Main", bundle: .main)
        }
    }
}

protocol StoryboardView: AnyObject {
    
    static var storyboardIdentifier: StoryboardIdentifier { get }
    static func instantiate() -> Self
}

extension StoryboardView where Self: UIViewController {
    
    static func instantiate() -> Self {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)
        
        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]
        
        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboardIdentifier.storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
