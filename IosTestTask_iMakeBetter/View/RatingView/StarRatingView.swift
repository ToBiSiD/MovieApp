//
//  StarRatingView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 16.11.2023.
//

import SwiftUI

struct StarRatingView: View {
    let rating: Double
    let maxRating: Double
    var size: CGFloat = 20

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<Int(maxRating)) { index in
                Image(systemName: index < Int(rating) ? "star.fill" : "star")
                    .foregroundColor(.starColor)
                    .font(.system(size: size))
            }
        }
    }
}

#Preview {
    StarRatingView(rating: 3, maxRating: 5, size: 20)
}
