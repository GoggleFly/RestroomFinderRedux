//
//  Actions.swift
//  RestroomFinderRedux
//
//  Created by David Ash on 09/10/2023.
//

import Foundation

protocol Action { }

struct FetchRestroomsAction: Action {
    let latitude: Double
    let longitude: Double
}

struct SetRestroomsAction: Action {
    let restrooms: [Restroom]
}
