//
//  ImageDownloader.swift
//  ReduxIntro
//
//  Created by David Ash on 08/10/2023.
//

import Foundation

class ImageDownloader: ObservableObject {
    @Published var downloadedData: Data? = nil
    
    func downloadImage(url: String) {
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is incorrect")
        }
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }
    }
}
