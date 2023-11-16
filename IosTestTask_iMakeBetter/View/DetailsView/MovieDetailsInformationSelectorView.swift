//
//  MovieDetailsInformationSelectorView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import SwiftUI

struct MovieDetailsInformationSelectorView: View {
    @State private var selectedOption = MovieDetailsOption.about
    var details: MovieDetails
    
    var body: some View {
        VStack(spacing: 24) {
            MovieDetailsSegmentPicker(selectedOption: $selectedOption).frame(height: 28)
            
            VStack {
                switch selectedOption {
                case .about:
                    AboutView(movieId: details.id, details: details)
                case .trailers:
                    TrailersView(movieId: details.id)
                case .similar:
                    SimilarMoviesView(moviedId: details.id)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}


