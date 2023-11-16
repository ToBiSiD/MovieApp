//
//  DetailsView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import SwiftUI

struct DetailsView: View {
    var title: String = ""
    var value: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .foregroundColor(.secondTextColor)
            Text(value)
                .foregroundColor(.textColor)
        }
        .font(.footnoteFont)
    }
}

#Preview {
    DetailsView()
}
