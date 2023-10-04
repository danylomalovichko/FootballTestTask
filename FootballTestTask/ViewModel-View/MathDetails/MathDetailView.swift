//
//  MathDetailView.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 29.09.2023.
//

import SwiftUI

struct MathDetailView: View {
    
    @EnvironmentObject var router: Router
    @AppStorage("isCompleteOnboarding") var isCompleteOnboarding: Bool = false
    
    @ObservedObject var vm: MathDetailVM
    
    @State private var selectedTab: Int = 0
    @State private var showingSheet = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                Button {
                    router.navigateBack()
                } label: {
                    Image("BackButton")
                        .resizable()
                        .frame(width: 38, height: 38)
                }
                
                Spacer()
                
                Button {
                    showingSheet.toggle()
                } label: {
                    Image("DotsButton")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
            
            
            DetailsTitleView(match: $vm.match)
                .padding(.top, 20)
            
            // Tabs
            TabsView(selectedTab: $selectedTab)
                .padding(.top, 10)
            
            // Views
            TabView(selection: $selectedTab,
                    content: {
                LeftTabView(match: $vm.match)
                    .tag(0)
                RightTabView(match: $vm.match)
                    .tag(1)
            })
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .padding(.horizontal, 16)
        .background {
            VStack {
                Image("DetailsTop")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 128)
                    .ignoresSafeArea(.all)
                    .frame(maxWidth: .infinity)
                
                Spacer()
            }
        }
        .toolbar(.hidden)
        .sheet(isPresented: $showingSheet) {
            Button {
                showingSheet = false
                router.navigateBack()
                isCompleteOnboarding = false
            } label: {
                Text("Reset to onBording (only for test)")
                    .font(Font.SF.medium(size: 17))
                    .foregroundColor(.white)
                    .frame(width: 257, height: 41)
                    .padding(.horizontal, 7)
                    .overlay(
                        RoundedRectangle(cornerRadius: 32)
                            .stroke(.red, lineWidth: 1)
                    )
            }
        }
    }
}
