//
//  Event.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 03.10.2023.
//

import Foundation

enum EventType: Codable, Hashable {
    case card(title: String, man: String, time: String)
    case goal(title: String, man: String, time: String)
    case replace(title: String, manIN: String, manOUT: String, time: String)
}

struct Event: Codable, Hashable {
    let type: EventType
}
