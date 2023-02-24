//
//  YoutubeView.swift
//  SearchYoutube
//
//  Created by 星優大 on 2023/02/20.
//

import SwiftUI
import WebKit

struct YoutubeView: UIViewRepresentable {
    var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: url)!))
    }
}

struct YoutubeView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeView(url: "https://www.rutles.net")
    }
}
