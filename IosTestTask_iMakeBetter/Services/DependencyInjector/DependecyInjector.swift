//
//  DependecyInjector.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 16.11.2023.
//

import Foundation

struct DependencyInjector {
    private static var dependencies: [String: Any] = [:]
    
    static func resolve<T>() -> T {
        guard let t = dependencies[String(describing: T.self)] as? T else {
            fatalError()
        }
        
        return t
    }
    
    static func register<T>(_ dependecy: T) {
        dependencies[String(describing: T.self)] = dependecy
    }
}
