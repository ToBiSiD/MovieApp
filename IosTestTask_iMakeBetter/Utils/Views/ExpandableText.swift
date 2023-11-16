//
//  ExpandableText.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 16.11.2023.
//

import SwiftUI

struct ExpandableText: View {
    @State private var isExpanded: Bool = false
    
    let text: String
    var symbolCap: Int = 100
    var unExpandedText: String = "...Read more"
    var expandedText: String = " Less"
    
    var body: some View {
        if text.count <= symbolCap {
            Text(text)
        } else {
            Group {
                Text(isExpanded ? text : String(text.prefix(symbolCap)))
                +
                Text(isExpanded ? expandedText : unExpandedText)
                    .foregroundColor(.buttonColor)
            }
            .onTapGesture {
                withAnimation(.easeInOut) {
                    isExpanded.toggle()
                }
            }
        }
    }
}

#Preview {
    ExpandableText(text: "")
}
