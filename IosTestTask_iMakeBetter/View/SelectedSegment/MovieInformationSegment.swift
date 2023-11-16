//
//  MovieInformationSegment.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import SwiftUI

struct MovieInformationSegment: View {
    @Binding var selectedOption: MovieDetailsOption
    var option: MovieDetailsOption = .about
    
    var body: some View {
        Button {
            withAnimation(.easeInOut) {
                selectedOption = option
            }
        } label: {
            Rectangle()
                .foregroundColor(.clear)
                .overlay(alignment: .center) {
                    Text(option.rawValue)
                        .font(.footnoteFont.weight(isSelected ? .semibold : .medium))
                }
                .overlay(alignment: .bottom) {
                    if isSelected {
                        Rectangle()
                            .frame(height: 1)
                    }
                }
        }
        .foregroundColor(isSelected ? .buttonColor : .secondTextColor)
    }
    
    private var isSelected: Bool {
        option == selectedOption
    }
}

#Preview {
    ZStack {
        BackgroundView()
        MovieInformationSegment(selectedOption: .constant(MovieDetailsOption.similar))
    }
}
