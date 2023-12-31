//
//  IosTestTask_iMakeBetterApp.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 14.11.2023.
//

import SwiftUI

@main
struct IosTestTask_iMakeBetterApp: App {
    @StateObject private var initalizer = ServicesInitializer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(initalizer)
        }
    }
}
