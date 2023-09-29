//
//  HomeView.swift
//  FootballTestTask
//
//  Created by ovr on 29.09.2023.
//

import SwiftUI

struct Match: Codable, Hashable {
    let title: String
    let result: String
}

struct HomeView: View {
    
    @EnvironmentObject var router: Router
    @AppStorage("isCompleteOnboarding") var isCompleteOnboarding: Bool = false
    
    let matchs: [Match] = [
        .init(title: "Bavaria - Ams", result: "7:0"),
        .init(title: "K - Ams", result: "1:1"),
        .init(title: "S - V", result: "7:7"),
        .init(title: "D - f", result: "0:0"),
        .init(title: "V - U", result: "1:5"),
    ]
    
    var body: some View {
        
        VStack {
            
            Text("HomeView")
            
            ForEach(matchs, id: \.self) { match in
                VStack {
                    Button {
                        router.navigate(to: .mathDetail(match: match))
                    } label: {
                        Text("\(match.title)")
                        Text("\(match.result)")
                    }
                }
            }
            
            
            Button("Reset to onbording (for test)") {
                isCompleteOnboarding = false
            }
        }
    }
    
}
