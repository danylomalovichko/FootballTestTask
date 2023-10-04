//
//  OnBoardingView.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 29.09.2023.
//

import SwiftUI

struct OnBoardingView: View {
    
    @StateObject var vm: OnBoardingVM
    
    @EnvironmentObject var router: Router
    @AppStorage("isCompleteOnboarding") var isCompleteOnboarding: Bool = false
    
    @State var currentPage: Int = 0
    
    var body: some View {
        TabView(selection: $currentPage){
            ForEach(vm.onBoardingItems, id: \.id) { item in
                
                VStack {
                    
                    Spacer(minLength: 0)
                    
                    Text("\(item.title)")
                        .font(Font.SF.displayBold(size: 34))
                        .foregroundColor(Color(hex: "2B8A64"))
                        .multilineTextAlignment(.center)
                    
                    Text("\(item.description)")
                        .font(Font.SF.regular(size: 16))
                        .foregroundColor(Color(hex: "242424").opacity(0.5))
                        .multilineTextAlignment(.center)
                        .padding(.top, 12)
                    
                    Button {
                        if currentPage == vm.onBoardingItems.count - 1 {
                            isCompleteOnboarding = true
                        } else {
                            currentPage += 1
                        }
                    } label: {
                        Text("Next")
                            .font(Font.SF.displaySemibold(size: 17))
                            .foregroundColor(.white)
                            .frame(width: 257, height: 41)
                            .background(.black)
                            .cornerRadius(32)
                    }
                    .padding(.top, 22)
                    
                    Button {
                        isCompleteOnboarding = true
                    } label: {
                        Text("Skip")
                            .font(Font.SF.displaySemibold(size: 17))
                            .foregroundColor(.black)
                            .frame(width: 257, height: 41)
                            .overlay(
                                RoundedRectangle(cornerRadius: 32)
                                    .stroke(.black, lineWidth: 1)
                            )
                    }
                    .padding(.horizontal, 12)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background {
                    Image(item.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea(.all)
                        .background(.white)
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
        .preferredColorScheme(.light)
    }
}

