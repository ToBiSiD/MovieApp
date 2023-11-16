//
//  MovieRowView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 16.11.2023.
//

import SwiftUI
import Kingfisher

struct MovieRowView: View {
    var id: Int
    var isAdult: Bool
    var imageUrl: String
    var title: String
    var date: String
    var rating: Double
    var popularity: Double
    
    var body: some View {
        NavigationLink {
            MovieDetailsView(movieId: id)
        } label: {
            VStack(spacing: 6) {
                Rectangle()
                    .foregroundColor(.secondTextColor)
                    .frame(height: 1)
                    
                HStack(alignment: .top, spacing: 16) {
                    LoadingImageView(imageURL: imageUrl, placeHolderWidth: 120, placeHolderHeight: 120)
                        .scaledToFit()
                        .frame(height: 120)
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(title)
                            .font(.footnoteFont)
                            .foregroundColor(.textColor)
                        
                        Text(date)
                            .font(.footnoteFont)
                            .foregroundColor(.secondTextColor)
                        
                        Spacer()
                        
                        Text(String(format: "Popularity: %.2f" , popularity))
                            .font(.footnoteFont)
                            .foregroundColor(.secondTextColor)
                        
                        StarRatingView(rating: rating/Double(2), maxRating: 5, size: 15)
                    }
                    
                    Spacer()
                }
                
                Rectangle()
                    .foregroundColor(.secondTextColor)
                    .frame(height: 1)
            }
            .padding(.top, 8)
            .frame(height: 130)
        }
    }
}
