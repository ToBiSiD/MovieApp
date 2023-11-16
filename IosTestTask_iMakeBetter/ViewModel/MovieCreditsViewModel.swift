//
//  MovieCreditsViewModel.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import Foundation
import Combine

final class MovieCreditsViewModel: ObservableObject {
    @Published var credits: MovieCredits?
    @Published var creditsLoadingError: String?

    @Inject private var apiService: MovieAPIServiceProtocol
    private var cancellables: Set<AnyCancellable> = []
    private var movieId: Int

    init(id: Int) {
        movieId = id

        loadMovieCredits()
    }

    private func loadMovieCredits() {
        apiService.fetchCredits(for: movieId)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.creditsLoadingError = error.localizedDescription
                }
            } receiveValue: { movieCredits in
                self.credits = movieCredits
                self.creditsLoadingError = nil
            }
            .store(in: &cancellables)
    }
}
