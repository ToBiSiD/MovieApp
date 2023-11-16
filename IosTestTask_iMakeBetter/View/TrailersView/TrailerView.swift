//
//  TrailerView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import SwiftUI

import SwiftUI
import WebKit

struct TrailerView: UIViewRepresentable {
    let trailerURL: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let url = URL(string: trailerURL)!
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
