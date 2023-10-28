//
//  GifImage.swift
//  paws
//
//  Created by Francisco Serrano on 3/11/23.
//

import SwiftUI
import WebKit

struct GifImage: NSViewRepresentable {
        
    private let name: String

    init(_ name: String) {
        self.name = name
    }

    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )


        return webView
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
       
    }

}


struct GifImage_Previews: PreviewProvider {
    static var previews: some View {
        GifImage("cat")
    }
}
