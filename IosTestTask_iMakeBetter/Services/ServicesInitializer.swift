//
//  ServicesInitializer.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 16.11.2023.
//

import Foundation

final class ServicesInitializer: ObservableObject {
    init() {
        @Provider var networkLoadService = NetworkLoadService() as NetworkLoadProtocol
        @Provider var movieAPIService = MovieAPIService(loadService: networkLoadService) as MovieAPIServiceProtocol
    }
    
    public func addDependecy<T: Any>(_ dependecy: T) {
        @Provider var newDependecy = dependecy
    }
}
