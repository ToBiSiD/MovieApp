//
//  PeopleAvatarView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import SwiftUI
import Kingfisher

struct PeopleAvatarView: View {
    var name: String
    var avatarURL: String
    
    var body: some View {
        ZStack(alignment: .top) {
            ZStack {
                ZStack {
                    LoadingImageView(imageURL: avatarURL, placeHolderWidth: 126, placeHolderHeight: 126)
                        .scaledToFill()
                    
                    Color.avatarGradient
                }
                .frame(width: 126, height: 126)
                .cornerRadius(16)
            }
            
            Text(name)
                .font(.smallfFootnoteFont.weight(.medium))
                .foregroundColor(.textColor)
                .padding(.top, 104)
        }
    }
}

#Preview {
    PeopleAvatarView(name: "", avatarURL: "")
}
