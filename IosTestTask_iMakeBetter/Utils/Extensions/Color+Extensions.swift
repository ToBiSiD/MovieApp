//
//  Color+Extensions.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 16.11.2023.
//

import SwiftUI

extension Color {
    static let backgroundGradient = LinearGradient(colors: [Color("BackgroundGradientTop"), Color("BackgroundGradientBottom")], startPoint: .top, endPoint: .bottom)
    static let avatarGradient = LinearGradient(colors: [.black.opacity(0), .black], startPoint: .top, endPoint: .bottom)
    static let textColor = Color("TextColor")
    static let secondTextColor = Color("SecondTextColor")
    static let labelColor = Color("LabelColor")
    static let starColor = Color("StarColor")
    static let buttonColor = Color("ButtonColor")
}
