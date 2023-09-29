//
//  OnBoardingView.swift
//  FootballTestTask
//
//  Created by ovr on 29.09.2023.
//

import SwiftUI

struct OnBoarding {
    let id: Int
    let title: String
    let description: String
    let imageName: String
}

struct OnBoardingView: View {
    
    @EnvironmentObject var router: Router
    @AppStorage("isCompleteOnboarding") var isCompleteOnboarding: Bool = false
    
    @State var currentPage: Int = 0
    
    var items: [OnBoarding] = [
        .init(id: 0, title: "All football", description: "1111", imageName: ""),
        .init(id: 1, title: "Learn", description: "222", imageName: ""),
        .init(id: 2, title: "Search", description: "333", imageName: ""),
    ]
    
    var body: some View {
        TabView(selection: $currentPage){
            ForEach(items, id: \.id) { item in
                VStack {
                    Image(item.imageName)
                    Text("\(item.title)")
                    Text("\(item.description)")
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
        
        
        Button("Next") {
            if currentPage == items.count - 1 {
                isCompleteOnboarding = true
            }else{
                currentPage += 1
            }
        }
        
        Button("Skip") {
            isCompleteOnboarding = true
        }
        
    }
}

