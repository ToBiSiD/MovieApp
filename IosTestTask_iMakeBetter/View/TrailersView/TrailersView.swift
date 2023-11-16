//
//  TrailersView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import SwiftUI

struct TrailersView: View {
    @ObservedObject var viewModel: MovieTrailersViewModel
    
    init(movieId: Int) {
        viewModel = MovieTrailersViewModel(id: movieId)
    }
    
    var body: some View {
        if let trailers = viewModel.trailers?.results {
            VStack {
                ForEach(trailers, id: \.self) { trailer in
                    NavigationLink {
                        TrailerView(trailerURL: trailer.trailerURL)
                            .ignoresSafeArea()
                    } label: {
                        VStack(alignment: .leading, spacing: 8) {
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.secondTextColor)
                            
                            Text(trailer.name)
                                .font(.smallTitleFont)
                                .foregroundColor(.textColor)
                            
                            Text(trailer.publishedDate)
                                .foregroundColor(.secondTextColor)
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.secondTextColor)
                        }
                        .font(.footnoteFont)
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
