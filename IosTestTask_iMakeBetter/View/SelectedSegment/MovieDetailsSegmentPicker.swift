//
//  MovieDetailsSegmentPicker.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import SwiftUI

struct MovieDetailsSegmentPicker: View {
    @Binding var selectedOption: MovieDetailsOption
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(MovieDetailsOption.allCases, id: \.self) { option in
                MovieInformationSegment(selectedOption: $selectedOption, option: option)
            }
        }
    }
}

#Preview {
    MovieDetailsSegmentPicker(selectedOption: .constant(.about))
}
