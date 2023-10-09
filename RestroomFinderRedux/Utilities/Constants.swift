//
//  Constants.swift
//  ReduxIntro
//
//  Created by David Ash on 08/10/2023.
//

import Foundation

//guard moviesURL = URL(string: Constants.Urls.urlBySearch(search: search)) else {
    
struct Constants {
    struct Urls {
        static func restroomsByLatAndLng(lat: Double, lng: Double) -> String {
            return "https://refugerestrooms.org/api/v1/restrooms/by_location?lat=\(lat)&lng=\(lng)"
        }
    }
}
