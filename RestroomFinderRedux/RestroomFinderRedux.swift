//
//  ReduxIntroApp.swift
//  ReduxIntro
//
//  Created by David Ash on 04/10/2023.
//

import SwiftUI

@main
struct RestroomFinderRedux: App {
    init() {
        configureTheme()
    }
    
    var body: some Scene {
        let store = Store(reducer: appReducer, state: AppState(), middleware: [logMiddleware()])
        
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
    
    private func configureTheme() {
        UINavigationBar.appearance().backgroundColor = UIColor(displayP3Red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
    }
}
