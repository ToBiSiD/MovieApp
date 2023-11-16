//
//  SimilarMoviesView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import SwiftUI

struct SimilarMoviesView: View {
    @ObservedObject private var viewModel: MovieSimilarViewModel
    
    init(moviedId: Int) {
        self.viewModel = MovieSimilarViewModel(id: moviedId)
    }
    
    var body: some View {
        if let similars = viewModel.similars?.results {
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(similars.prefix(5), id: \.self) { similar in
                        MovieRowView(id: similar.id, isAdult: similar.adult, imageUrl: similar.imagePath, title: similar.title, date: similar.formattedRealeseDate, rating: similar.voteAverage, popularity: similar.popularity)
                    }
                }
            }
        } else if let error = viewModel.error {
            ErrorView(text: error)
        } else {
            AnimatedTextWithDotsView(text: "Loading movie data")
        }

    }
}
