//
//  RootView.swift
//  WeatherWorkTask
//
//  Created by Danylo Malovichko on 04.09.2023.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var appState: AppState
    @AppStorage("isCompleteOnboarding") var isCompleteOnboarding: Bool = false
    @AppStorage("isLoading") var isLoading: Bool = true
    
    var body: some View {
        if isLoading {
            PreloaderView()
        } else {
            if isCompleteOnboarding {
                HomeView(vm: .init(appState.container))
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                        case .mathDetail(let matchID):
                            MathDetailView(vm: .init(appState.container, matchID: matchID))
                        }
                    }
            } else {
                OnBoardingView(vm: .init(appState.container))
                    .onAppear {
                        // get each of the font families
                        for family in UIFont.familyNames.sorted() {
                            let names = UIFont.fontNames(forFamilyName: family)
                            // print array of names
                            print("Family: \(family) Font names: \(names)")
                        }
                    }
            }
        }
    }
}


