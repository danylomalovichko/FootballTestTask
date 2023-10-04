//
//  H2H.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 03.10.2023.
//

import Foundation

struct H2H: Codable, Hashable {
    let data: Date
    let titleFirst: String
    let resultFirst: String
    let logoFirst: String
    let titleSecond: String
    let resultSecond: String
    let logoSecond: String
}

