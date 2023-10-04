//
//  RightTabView.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 02.10.2023.
//

import SwiftUI

struct RightTabView: View {
    
    @Binding var match: Match?
    
    var body: some View {
        
        VStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(match?.h2h ?? [], id: \.self) { h2h in
                        H2HCellView(vm: .init(h2h: h2h))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 12)
                    .padding(.trailing, 10)
                    .background(Color(hex: "2F2F2F"))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(hex: "404040"), lineWidth: 1)
                    )
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
