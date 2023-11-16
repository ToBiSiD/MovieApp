//
//  MovieAPIService.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import Foundation
import Combine

protocol MovieAPIServiceProtocol {
    func fetchMovieDetails(for movieId: Int)  -> AnyPublisher<MovieDetails, Error>
    func fetchCredits(for movieId: Int)  -> AnyPublisher<MovieCredits, Error>
    func fetchVideos(for movieId: Int)  -> AnyPublisher<MovieVideos, Error>
    func fetchSimilar(for movieId: Int)  -> AnyPublisher<SimilarMovies, Error>
    func addRating(for movieId: Int, ratingValue: Float) -> AnyPublisher<Void, Error>
}

final class MovieAPIService: MovieAPIServiceProtocol {
    private var loadService: NetworkLoadProtocol
    
    private var headers = [
        "accept": "application/json",
        "Authorization": "Bearer \(Constants.APIReadKey)"
    ]
    
    init(loadService: NetworkLoadProtocol) {
        self.loadService = loadService
    }
    
    func fetchMovieDetails(for movieId: Int) -> AnyPublisher<MovieDetails, Error> {
        return fetchData(for: "\(Constants.movieDetailsLink)\(movieId)")
    }
    
    func fetchCredits(for movieId: Int) -> AnyPublisher<MovieCredits, Error> {
        return fetchData(for: "\(Constants.movieDetailsLink)\(movieId)/credits")
    }
    
    func fetchVideos(for movieId: Int) -> AnyPublisher<MovieVideos, Error> {
        return fetchData(for: "\(Constants.movieDetailsLink)\(movieId)/videos")
    }
    
    func fetchSimilar(for movieId: Int) -> AnyPublisher<SimilarMovies, Error> {
        return fetchData(for: "\(Constants.movieDetailsLink)\(movieId)/similar")
    }
    
    func addRating(for movieId: Int, ratingValue: Float) -> AnyPublisher<Void, Error> {
        do {
            let ratingData: [String: Any] = ["value": ratingValue]
            let jsonData = try JSONSerialization.data(withJSONObject: ratingData)
            
            var request = buildRequest(for: "\(Constants.movieDetailsLink)\(movieId)/rating", httpMethod: .post)
            request.httpBody = jsonData
            request.addValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
            
            return loadService.postData(request: request as URLRequest)
        } catch {
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
    }
    
    private func fetchData<T: Decodable>(for link: String) -> AnyPublisher<T, Error> {
        let request = buildRequest(for: link)
        
        return loadService.fetchData(for: request as URLRequest)
            .eraseToAnyPublisher()
    }
    
    private func buildRequest(for link: String, httpMethod: HTTPMethod = .get) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(url: NSURL(string: link)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headers
        return request
    }
}

