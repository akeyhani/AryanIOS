//
//  WebView.swift
//  AryanIOS
//
//  Created by Aryan Key on 2025-03-31.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable{
    let webText: String?
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let text = webText, let url = URL(string: text) else {
            return
        }
        
        let urlRequest = URLRequest(url: url)
        uiView.load(urlRequest)
    }
    typealias UIViewType = WKWebView
}
