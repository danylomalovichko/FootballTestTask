//
//  HomeVM.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 03.10.2023.
//

import Foundation
import Combine

@MainActor
class HomeVM: BaseVM {
    
    @Published var matches: [Match] = []
        
    override init(_ container: DependencyContainer) {
        super.init(container)
        
        container.dataService.matches
            .compactMap { $0 }
            .assign(to: &$matches)
    }
}
