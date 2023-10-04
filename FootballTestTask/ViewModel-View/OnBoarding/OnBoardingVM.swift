//
//  OnBoardingVM.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 03.10.2023.
//

import Foundation
import Combine

@MainActor
class OnBoardingVM: BaseVM {
    
    @Published var onBoardingItems: [OnBoarding] = []
        
    override init(_ container: DependencyContainer) {
        super.init(container)
        
        container.dataService.onBoardingItems
            .compactMap { $0 }
            .assign(to: &$onBoardingItems)
    }
}
