//
//  BackgroundView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Color("Background")
            Color.backgroundGradient
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
