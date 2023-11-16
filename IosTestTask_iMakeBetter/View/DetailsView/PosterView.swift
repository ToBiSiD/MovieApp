//
//  PosterView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import SwiftUI
import Kingfisher

struct PosterView: View {
    var isAdult: Bool
    var posterURL: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            LoadingImageView(imageURL: posterURL, placeHolderWidth: UIScreen.main.bounds.width, placeHolderHeight: 233)
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .frame(height: 233)
            
            if isAdult {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 30, height: 18)
                        .foregroundColor(.labelColor)
                    
                    Text("16+")
                        .foregroundColor(.textColor)
                        .font(.footnoteFont)
                }
                .padding(.leading, 16)
                .padding(.top, 16)
            }
        }
        .padding(.top, 16)
    }
}
