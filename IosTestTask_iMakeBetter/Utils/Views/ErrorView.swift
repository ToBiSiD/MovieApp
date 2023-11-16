//
//  ErrorView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 16.11.2023.
//

import SwiftUI

struct ErrorView: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.titleFont.weight(.bold))
            .foregroundColor(.red)
    }
}

#Preview {
    ErrorView(text: "Error text")
}
