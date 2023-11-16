//
//  MovieSimilarViewModel.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import Foundation
import Combine

final class MovieSimilarViewModel: ObservableObject {
    @Published var similars: SimilarMovies?
    @Published var error: String?

    @Inject private var apiService: MovieAPIServiceProtocol
    private var cancellables: Set<AnyCancellable> = []
    private var movieId: Int

    init(id: Int) {
        movieId = id

        loadSimilarMovies()
    }

    private func loadSimilarMovies() {
        apiService.fetchSimilar(for: movieId)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error.localizedDescription
                }
            } receiveValue: { similarMovies in
                self.similars = similarMovies
                self.error = nil
            }
            .store(in: &cancellables)
    }
}

