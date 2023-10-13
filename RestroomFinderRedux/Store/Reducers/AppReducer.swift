//
//  AppReducer.swift
//  ReduxIntro
//
//  Created by David Ash on 04/10/2023.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) -> AppState {
    var state = state
    state.restrooms = restroomReducer(state.restrooms, action)
    return state
}
