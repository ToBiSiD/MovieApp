//
//  LoadingImageView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 16.11.2023.
//

import SwiftUI
import Kingfisher

struct LoadingImageView: View {
    var imageURL: String = ""
    var placeHolderWidth: CGFloat?
    var placeHolderHeight: CGFloat?
    var placeHolderMaxWidth: CGFloat?
    var placeHolderMaxHeight: CGFloat?
    
    var body: some View {
        KFImage(URL(string: imageURL))
            .placeholder {
                HStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.secondary)
                        
                        VStack(spacing: 8) {
                            SpinningCircle(lineWidth: 5, color: .buttonColor)
                                .frame(maxWidth: 50, maxHeight: 50)
                            
                            AnimatedTextWithDotsView(text: "Loading")
                                .font(.footnoteFont.weight(.medium))
                                .foregroundColor(.textColor)
                        }
                    }
                }
                .frame(width: placeHolderWidth, height: placeHolderHeight)
                .frame(maxWidth: placeHolderMaxWidth, maxHeight: placeHolderMaxHeight)
            }
            .resizable()
    }
}

#Preview {
    LoadingImageView()
}
