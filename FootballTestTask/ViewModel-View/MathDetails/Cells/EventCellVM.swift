//
//  EventCellVM.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 03.10.2023.
//

import Foundation

class EventCellVM: ObservableObject {
    
    @Published var event: Event?
    
    init(event: Event) {
        self.event = event
    }
}
