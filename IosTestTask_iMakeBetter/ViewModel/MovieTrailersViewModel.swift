//
//  MovieTrailersViewModel.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import Foundation
import Combine

final class MovieTrailersViewModel: ObservableObject {
    @Published var trailers: MovieVideos?
    @Published var error: String?

    @Inject private var apiService: MovieAPIServiceProtocol
    private var cancellables: Set<AnyCancellable> = []
    private var movieId: Int

    init(id: Int) {
        movieId = id

        loadVideos()
    }

    private func loadVideos() {
        apiService.fetchVideos(for: movieId)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break 
                case .failure(let error):
                    self.error = error.localizedDescription
                }
            } receiveValue: { videos in
                self.trailers = videos
                self.error = nil
            }
            .store(in: &cancellables)
    }
}

