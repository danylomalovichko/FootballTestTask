//
//  H2HCellVM.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 03.10.2023.
//

import Foundation

class H2HCellVM: ObservableObject {
    
    @Published var h2h: H2H?
    
    init(h2h: H2H) {
        self.h2h = h2h
    }
}
