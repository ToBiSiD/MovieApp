//
//  RatingView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import SwiftUI

struct RatingView: View {
    var currentRating: Double
    var onClickAction: () -> Void
    
    var body: some View {
        HStack {
            StarRatingView(rating: currentRating, maxRating: 5)
            
            Spacer()
            
            Button {
                onClickAction()
            } label: {
                Text("+ Add feedback")
                    .foregroundColor(.secondTextColor)
                    .font(.footnoteFont)
                    .underline()
            }
        }
        .padding(.horizontal, 16)
    }
}
