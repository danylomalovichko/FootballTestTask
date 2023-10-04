//
//  FootballTestTaskApp.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 29.09.2023.
//

import SwiftUI

@main
struct FootballTestTask: App {
    
    @ObservedObject var router = Router()
    @StateObject var appState = AppState(container: DependencyContainer())
    @AppStorage("isLoading") var isLoading: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationStack(path: $router.navPath) {
                    RootView()
                        .environmentObject(appState)
                }
                .environmentObject(router)
            }
            .onAppear {
                isLoading = true
            }
        }
    }
}
