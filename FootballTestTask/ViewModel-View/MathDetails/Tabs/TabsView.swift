//
//  TabsView.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 02.10.2023.
//

import SwiftUI

struct TabsView: View {
    
    @Binding var selectedTab: Int
    
    let tabs = ["Events", "H2H"]
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack(spacing: 0) {
                HStack(spacing: 10) {
                    ForEach(0 ..< tabs.count, id: \.self) { row in
                        Button(action: {
                            withAnimation {
                                selectedTab = row
                            }
                        }, label: {
                            VStack(spacing: 0) {
                                HStack(spacing: 10) {
                                    Text(tabs[row])
                                        .font(Font.SF.regular(size: 17))
                                        .foregroundColor(selectedTab == row ? .white : Color(hex: "36AA7B"))
                                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                                        .background {
                                                RoundedRectangle(cornerRadius: 27)
                                                .fill(selectedTab == row ? Color(hex: "36AA7B") : Color(hex: "36AA7B").opacity(0.2))
                                           
                                        }
                                }
                            }
                        })
                        .accentColor(Color.white)
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                    Spacer()
                }
                .padding(.leading, 14)
            }
            .onChange(of: selectedTab) { target in
                withAnimation {
                    proxy.scrollTo(target)
                }
            }
            
        }
    }
}
