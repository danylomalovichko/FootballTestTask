//
//  DataService.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 03.10.2023.
//

import Foundation
import Combine

@MainActor
protocol DataService {
    var matches: CurrentValueSubject<[Match]?, Never> { get }
    var onBoardingItems: CurrentValueSubject<[OnBoarding]?, Never> { get }
}

class DataManager: DataService {
    
    
    let matches = CurrentValueSubject<[Match]?, Never>(nil)
    let onBoardingItems = CurrentValueSubject<[OnBoarding]?, Never>(nil)
    
    init() {
        
        let events: [Event] = [
            .init(type: .replace(title: "REPLACE", manIN: "Scott Herwitz", manOUT: "Max Fly", time: "72")),
            .init(type: .card(title: "YELLOW CARD", man: "Max Fly", time: "79")),
            .init(type: .goal(title: "GOAL!!!", man: "Dan Frei", time: "89")),
            .init(type: .card(title: "RED CARD", man: "Scott Scott", time: "90")),
            .init(type: .replace(title: "REPLACE", manIN: "Sad Boy", manOUT: "Joy Boy", time: "112"))
        ]
        
        let h2h: [H2H] = [
            .init(data: Date(), titleFirst: "Harbor City FC", resultFirst: "3", logoFirst: "RoyalLogo", titleSecond: "Kyiv City FC", resultSecond: "4", logoSecond: "DinamoKievLogo"),
            .init(data: Date(), titleFirst: "Tarbor City FC", resultFirst: "4", logoFirst: "DinamoKievLogo", titleSecond: "Kyiv City FC", resultSecond: "4", logoSecond: "DinamoKievLogo"),
            .init(data: Date(), titleFirst: "Harbor City FC", resultFirst: "5", logoFirst: "RoyalLogo", titleSecond: "Odessa City FC", resultSecond: "4", logoSecond: "DinamoKievLogo"),
            .init(data: Date(), titleFirst: "Harbor City FC", resultFirst: "8", logoFirst: "DinamoKievLogo", titleSecond: "Harkiv City FC", resultSecond: "4", logoSecond: "DinamoKievLogo"),
            .init(data: Date(), titleFirst: "Harbor City FC", resultFirst: "9", logoFirst: "RoyalLogo", titleSecond: "Kyiv City FC", resultSecond: "4", logoSecond: "DinamoKievLogo"),
            .init(data: Date(), titleFirst: "Harbor City FC", resultFirst: "7", logoFirst: "RoyalLogo", titleSecond: "Lviv City FC", resultSecond: "4", logoSecond: "DinamoKievLogo"),
        ]
        
        let matches: [Match] = [
            .init(id: UUID().uuidString, date: Date(), league: "London Blitz", teamOneTitle: "Bavaria - Ams", teamSecondTitle: "Dinamo Kyiv", resultOne: 0, resultSecond: 7, logoOneName: "RoyalLogo", logoSecondName: "DinamoKievLogo", events: events, h2h: h2h, time: "59"),
            .init(id: UUID().uuidString, date: Date(), league: "Kyiv Blitz", teamOneTitle: "Dinamo Kyiv", teamSecondTitle: "Bavaria - Ams", resultOne: 10, resultSecond: 2, logoOneName: "DinamoKievLogo", logoSecondName: "RoyalLogo", events: events, h2h: h2h, time: "101"),
            .init(id: UUID().uuidString, date: Date(), league: "Monako Blitz", teamOneTitle: "Royal Phoenix", teamSecondTitle: "Dinamo Kyiv", resultOne: 4, resultSecond: 4, logoOneName: "RoyalLogo", logoSecondName: "DinamoKievLogo", events: events, h2h: h2h, time: "62"),
            .init(id: UUID().uuidString, date: Date(), league: "Rome Blitz",teamOneTitle: "Royal Phoenix", teamSecondTitle: "Dinamo Kyiv", resultOne: 0, resultSecond: 9, logoOneName: "RoyalLogo", logoSecondName: "DinamoKievLogo", events: events, h2h: h2h, time: "58"),
            .init(id: UUID().uuidString, date: Date(), league: "Milane Blitz", teamOneTitle: "Royal Phoenix", teamSecondTitle: "Dinamo Kyiv", resultOne: 5, resultSecond: 1, logoOneName: "RoyalLogo", logoSecondName: "RoyalLogo", events: events, h2h: h2h, time: "112")
        ]
        
        self.matches.send(matches)
        
        let onBoardingItems: [OnBoarding] = [
            .init(id: 0, title: "All football events in one place", description: "Stay up to date with the latest results of your favorite matches.", imageName: "OnBoarding01"),
            .init(id: 1, title: "Learn more about your favorite team", description: "Stay up to date with the latest results of your favorite matches. ", imageName: "OnBoarding02"),
            .init(id: 2, title: "Search football events by map", description: "Stay up to date with the latest results of your favorite matches.", imageName: "OnBoarding03"),
        ]
        
        self.onBoardingItems.send(onBoardingItems)
    }
}
