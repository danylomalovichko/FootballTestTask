//
//  MathDetailVM.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 02.10.2023.
//

import Foundation

@MainActor
class MathDetailVM: ObservableObject {
    
    let container: DependencyContainer

    @Published var match: Match?
    
     init(_ container: DependencyContainer, matchID: String) {
         self.container = container
         
        container.dataService.matches
            .compactMap { $0 }
            .map {
                $0.first(where: { $0.id == matchID })
            }
            .assign(to: &$match)
    }
}
