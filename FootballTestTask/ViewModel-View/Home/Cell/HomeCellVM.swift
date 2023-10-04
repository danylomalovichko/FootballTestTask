//
//  HomeCellVM.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 02.10.2023.
//

import Foundation

@MainActor
class HomeCellVM: ObservableObject {
    
    @Published var match: Match?
    
    struct Props: Hashable {
        let match: Match?
    }
    
    let props: Props
    
    init(_ props: Props) {
        self.props = props
        self.match = props.match
    }
}
