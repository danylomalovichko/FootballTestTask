//
//  Match.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 02.10.2023.
//

import Foundation

struct Match: Codable, Hashable {
    let id: String
    let date: Date
    let league: String
    let teamOneTitle: String
    let teamSecondTitle: String
    let resultOne: Int
    let resultSecond: Int
    let logoOneName: String
    let logoSecondName: String
    let events: [Event]?
    let h2h: [H2H]?
    let time: String
}
