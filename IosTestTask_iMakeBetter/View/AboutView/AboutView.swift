//
//  AboutView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import SwiftUI

struct AboutView: View {
    @ObservedObject private var viewModel: MovieCreditsViewModel
    var details: MovieDetails
    
    init(movieId: Int, details: MovieDetails) {
        self.details = details
        self.viewModel = MovieCreditsViewModel(id: movieId)
    }
    
    var body: some View {
        if let credits = viewModel.credits {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 16){
                        DetailsView(title: "Genre:", value: details.allGenre)
                        
                        DetailsView(title: "Year:", value: details.releaseYear)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        DetailsView(title: "Language text:", value: details.languages)
                        
                        DetailsView(title: "Country:", value: details.countries)
                    }
                    
                }
                
                EmployeesView(title: "Creators", employees: credits.creators, takeOnly: 5)
                EmployeesView(title: "Actors", employees: credits.cast, takeOnly: 10)
            }
        } else if let error = viewModel.creditsLoadingError {
            ErrorView(text: error)
        } else {
            AnimatedTextWithDotsView(text: "Loading movie data")
        }
        
    }
}
