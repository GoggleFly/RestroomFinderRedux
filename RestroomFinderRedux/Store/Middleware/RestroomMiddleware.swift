//
//  RestroomMiddleware.swift
//  RestroomFinderRedux
//
//  Created by David Ash on 13/10/2023.
//

import Foundation

func restroomMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        switch action {
        case let action as FetchRestroomsAction:
            getRestroomsByLatAndLng(action: action, dispatch: dispatch)
        default:
            break
        }
    }
}

private func getRestroomsByLatAndLng(action: FetchRestroomsAction, dispatch: @escaping Dispatcher) {
    WebService().getRestroomsByLatAndLng(lat: action.latitude, lng: action.longitude) { result in
        switch result {
        case .success(let restrooms):
            if let restrooms = restrooms {
                dispatch(SetRestroomsAction(restrooms: restrooms))
            }
        case .failure(let failure):
            print(failure.localizedDescription)
        }
    }
}
