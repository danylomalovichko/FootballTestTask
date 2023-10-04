//
//  LeftTabView.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 02.10.2023.
//

import SwiftUI

struct LeftTabView: View {
    
    @Binding var match: Match?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(match?.events ?? [], id: \.self) { event in
                    EventCellView(vm: .init(event: event))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
