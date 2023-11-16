//
//  MovieDetailsView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import SwiftUI
import Kingfisher

struct MovieDetailsView: View {
    @ObservedObject private var viewModel: MovieViewModel
    
    init(movieId: Int) {
        viewModel = MovieViewModel(id: movieId)
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            if let details = viewModel.details {
                ScrollView {
                    VStack(spacing: 0) {
                        HeaderView()
                        
                        VStack(spacing: 16) {
                            PosterView(isAdult: details.adult, posterURL: details.imagePath)
                            
                            MovieInformationView(details: details)
                            
                            MovieDetailsInformationSelectorView(details: details)
                            
                            RatingView(currentRating: details.voteAverage / Double(2), onClickAction: {
                                viewModel.addRating()
                            })
                            .padding(.top, 32)
                        }
                    }
                }
            } else if let error = viewModel.detailsLoadingError {
                ErrorView(text: error)
            } else {
                AnimatedTextWithDotsView(text: "Loading movie data")
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

#Preview {
    MovieDetailsView(movieId: 872585)
}
