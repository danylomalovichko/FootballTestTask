//
//  HomeView.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 29.09.2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var router: Router
        
    @StateObject var vm: HomeVM
        
    var body: some View {

        VStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(vm.matches, id: \.self) { match in
                        VStack {
                            HomeCellView(vm: .init(.init(match: match)))
                        }
                    }
                }
            }
            .padding(.top, 60)
            .overlay {
                VStack {
                    HStack(spacing: 0) {
                        Text("AER")
                            .font(Font.SF.bold(size: 48))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .padding(.leading, 16)
                            .padding(.top, 87)
                        
                        Spacer()
                        
                    }
                    .frame(height: 58)
                    .frame(maxWidth: .infinity)
                    .ignoresSafeArea(.all)
                    .background {
                        Image("HomeTopPlaceholder")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 128)
                            .ignoresSafeArea(.all)
                            .frame(maxWidth: .infinity)
                    }
                    
                    Spacer()
                }
            }
        }
        .background(Color(hex: "242424"))
        .preferredColorScheme(.dark)
    }
    
}
