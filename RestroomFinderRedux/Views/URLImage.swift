//
//  URLImage.swift
//  ReduxIntro
//
//  Created by David Ash on 08/10/2023.
//

import SwiftUI

struct URLImage: View {
    let url: String
    @ObservedObject private var imageDownloader: ImageDownloader = ImageDownloader()
    
    init(url: String) {
        self.url = url
        self.imageDownloader.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let imageData = self.imageDownloader.downloadedData {
            let img = UIImage(data: imageData)
            
            return VStack {
                Image(uiImage: img!)
                    .resizable()
            }
        } else {
            return VStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
            }
        }
    }
}
