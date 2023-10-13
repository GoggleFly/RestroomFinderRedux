//
//  Store.swift
//  ReduxIntro
//
//  Created by David Ash on 04/10/2023.
//

import Foundation

typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void
typealias Dispatcher = (Action) -> Void

protocol ReduxState { }

struct AppState: ReduxState {
    var restrooms: RestroomState = RestroomState()
}

struct RestroomState: ReduxState {
    var restrooms: [Restroom] = []
}

class Store<StoreState: ReduxState>: ObservableObject {
    @Published private(set) var state: StoreState
    var reducer: Reducer<StoreState>
    var middleware: [Middleware<StoreState>]
    
    init(reducer: @escaping Reducer<StoreState>, state: StoreState, middleware: [Middleware<StoreState>] = []) {
        self.reducer = reducer
        self.state = state
        self.middleware = middleware
    }
    
    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
        
        // run middleware
        middleware.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}
