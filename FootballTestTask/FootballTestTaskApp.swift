//
//  FootballTestTaskApp.swift
//  FootballTestTask
//
//  Created by ovr on 29.09.2023.
//

import SwiftUI

@main
struct FootballTestTask: App {
    
    @ObservedObject var router = Router()
    @AppStorage("isCompleteOnboarding") var isCompleteOnboarding: Bool = false
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                if isCompleteOnboarding {
                    HomeView()
                        .navigationDestination(for: Router.Destination.self) { destination in
                            switch destination {
                            case .mathDetail(let match):
                                MathDetailView(math: match)
                            }
                        }
                } else {
                    OnBoardingView()
                }
            }

            .environmentObject(router)
        }
        
    }
}
