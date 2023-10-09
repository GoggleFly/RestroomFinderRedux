//
//  LogMiddleware.swift
//  ReduxIntro
//
//  Created by David Ash on 06/10/2023.
//

import Foundation

func logMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        print("[LOG MIDDLEWARE]")
    }
}
