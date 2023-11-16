//
//  HeaderView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("Hi, Kristina")
                .font(.smallTitleFont.weight(.semibold))
            
            Spacer()
            
            Image(systemName:  "square.and.arrow.up")
                .frame(width: 18 , height: 22)
        }
        .foregroundColor(Color.textColor)
        .padding(.horizontal, 16)
    }
}
