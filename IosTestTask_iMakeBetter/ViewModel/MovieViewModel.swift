//
//  MovieViewModel.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import Foundation
import Combine

final class MovieViewModel: ObservableObject {
    @Published var details: MovieDetails?
    @Published var detailsLoadingError: String?
    
    @Inject private var apiService: MovieAPIServiceProtocol
    private var cancellables: Set<AnyCancellable> = []
    private var movieId: Int
    
    init(id: Int) {
        movieId = id
        
        fetchMovieData()
    }
    
    deinit {
        for cancelable in cancellables {
            cancelable.cancel()
        }
    }
    
    private func fetchMovieData() {
        apiService.fetchMovieDetails(for: movieId)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.detailsLoadingError = error.localizedDescription
                }
            } receiveValue: { details in
                self.details = details
                self.detailsLoadingError = nil
            }
            .store(in: &cancellables)
    }
    
    func addRating() {
        DebugLogger.printLog("Add rating")
        apiService.addRating(for: movieId, ratingValue: 10)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    DebugLogger.printLog("success set 10 rating")
                case .failure(let error):
                    DebugLogger.printLog("failure set 10 rating with error: \(error.localizedDescription)")
                }
            } receiveValue: { _ in
            }
            .store(in: &cancellables)
    }
}

