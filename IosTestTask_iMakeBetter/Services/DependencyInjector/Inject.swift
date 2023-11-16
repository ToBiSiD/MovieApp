//
//  Inject.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 16.11.2023.
//

import Foundation

@propertyWrapper struct Inject<T> {
    var wrappedValue: T
    
    init() {
        self.wrappedValue = DependencyInjector.resolve()
    }
}
