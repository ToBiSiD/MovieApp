//
//  NetworkAPIService.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import Foundation
import Combine

typealias DataService = Service & DataHandler
typealias NetworkService = DataService & NetworkHandler

protocol NetworkLoadProtocol: NetworkService {
    func fetchData<T: Decodable>(using url: URL?) -> AnyPublisher<T, Error>
    func fetchData<T: Decodable>(for request: URLRequest?) -> AnyPublisher<T, Error>
    func postData(request: URLRequest?) -> AnyPublisher<Void, Error>
}

final class NetworkLoadService: NetworkLoadProtocol {
    private(set) var decoder: JSONDecoder
    private(set) var encoder: JSONEncoder
    
    private(set) var loadedData: [String: Decodable] = [:]
    
    init() {
        self.decoder = JSONDecoder()
        self.encoder = JSONEncoder()
    }
    
    func fetchData<T: Decodable>(using url: URL?) -> AnyPublisher<T, Error> {
        guard let url = url else {
            return Fail(error: NetworkError.invalidLink).eraseToAnyPublisher()
        }
        
        if let cachedData = loadedData[url.absoluteString] as? T {
            return Just(cachedData)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                try self.tryHandleResponse(response, data: data)
            }
            .handleEvents(receiveOutput: { [weak self] decodedData in
                self?.loadedData[url.absoluteString] = decodedData
            })
            .eraseToAnyPublisher()
    }
    
    func fetchData<T: Decodable>(for request: URLRequest?) -> AnyPublisher<T, Error> {
        guard let request = request else {
            return Fail(error: NetworkError.invalidRequest).eraseToAnyPublisher()
        }
    
        if let cachedData = loadedData[request.url?.absoluteString ?? ""] as? T {
            return Just(cachedData)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                try self.tryHandleResponse(response, data: data)
            }
            .handleEvents(receiveOutput: { [weak self] decodedData in
                self?.loadedData[request.url?.absoluteString ?? ""] = decodedData
            })
            .eraseToAnyPublisher()
    }
    
    func postData(request: URLRequest?) -> AnyPublisher<Void, Error> {
        guard let request = request else {
            return Fail(error: NetworkError.invalidRequest).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: request as URLRequest)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw URLError(.badServerResponse)
                }
                
                if (200..<300).contains(httpResponse.statusCode) {
                    return ()
                } else {
                    throw NetworkError.requestError(errorCode: httpResponse.statusCode)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    private func tryHandleResponse<T: Decodable>(_ response: URLResponse, data: Data) throws -> T {
        try tryCheckResponse(response: response)
        let decodeData: T = try decodeData(data: data)
        return decodeData
    }
}
