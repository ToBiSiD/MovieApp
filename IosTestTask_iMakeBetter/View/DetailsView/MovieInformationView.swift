//
//  MovieInformationView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import SwiftUI

struct MovieInformationView: View {
    var details: MovieDetails
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                Text(details.title)
                    .foregroundColor(Color.textColor)
                    .font(.titleFont.weight(.bold))
                    .multilineTextAlignment(.center)
                
                HStack(alignment: .center)
                {
                    Text(details.releaseYear)
                        .monospacedDigit()
                    
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 4, height: 4)
                    
                    Text(details.allGenre)
                    
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 4, height: 4)
                    
                    Text(details.duration)
                        .monospacedDigit()
                }
                .font(.footnoteFont)
                .foregroundColor(Color.secondTextColor)
            }
            
            ExpandableText(text: details.overview, symbolCap: 150)
                .font(.footnoteFont)
                .foregroundColor(.secondTextColor)
        }
        .padding(.horizontal, 16)
    }
}
