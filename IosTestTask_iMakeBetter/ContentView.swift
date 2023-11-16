//
//  ContentView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 14.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            MovieDetailsView(movieId: 466272)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ServicesInitializer())
}
