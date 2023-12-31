//
//  WebService.swift
//  ReduxIntro
//
//  Created by David Ash on 08/10/2023.
//

import Foundation

enum NetworkError: Error {
    case badURL, decodingError, noData
}

class WebService {
    
    func getRestroomsByLatAndLng(lat: Double, lng: Double, completion: @escaping (Result<[Restroom]?, NetworkError>) -> Void) {
        print(Constants.Urls.restroomsByLatAndLng(lat: lat, lng: lng))
        
        guard let resourceURL = URL(string: Constants.Urls.restroomsByLatAndLng(lat: lat, lng: lng)) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: resourceURL) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            let restrooms = try? JSONDecoder().decode([Restroom].self, from: data)
            completion(.success(restrooms))
        }.resume()
    }
    
}
