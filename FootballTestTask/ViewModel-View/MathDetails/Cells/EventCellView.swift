//
//  EventCellView.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 03.10.2023.
//

import Foundation
import SwiftUI

struct EventCellView: View {
    
    @StateObject var vm: EventCellVM

    var body: some View {
        VStack(spacing: 0) {
            switch vm.event?.type {
            case .card(let title, let man, let time):
                HStack {
                    
                    Image(title == "RED CARD" ? "RedCard" : "YellowCard")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text(title)
                        .foregroundColor(Color(hex: "#36AA7B"))
                        .font(Font.SF.regular(size: 12))
                    
                    Spacer()
                    
                    Text(time + "❜")
                        .font(Font.SF.regular(size: 13))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                
                HStack {
                    Text(man)
                        .font(Font.SF.regular(size: 14))
                    
                    Spacer()
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                
            case .goal(let title, let man, let time):
                HStack {
                    Text(time + "❜")
                        .font(Font.SF.regular(size: 13))
                    
                    Spacer()
                    
                    Text(title)
                        .foregroundColor(Color(hex: "#36AA7B"))
                        .font(Font.SF.regular(size: 12))
                    
                    Image("Ball")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                
                HStack {
                    Spacer()
                    
                    Text(man)
                        .font(Font.SF.regular(size: 14))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)

            case .replace(let title, let manIN, let manOUT, let time):
                HStack {
                    
                    Image("Replace")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text(title)
                        .foregroundColor(Color(hex: "#36AA7B"))
                        .font(Font.SF.regular(size: 12))
                    
                    Spacer()
                    
                    Text(time + "❜")
                        .font(Font.SF.regular(size: 13))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                
                VStack {
                    HStack {
                        Text("IN ")
                            .foregroundColor(Color(hex: "#36AA7B"))
                            .font(Font.SF.regular(size: 14))
                        +
                        Text(manIN)
                            .font(Font.SF.regular(size: 14))
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("OUT ")
                            .foregroundColor(Color(hex: "#EC3535"))
                            .font(Font.SF.regular(size: 14))
                        +
                        Text(manOUT)
                            .font(Font.SF.regular(size: 14))
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                
            case .none:
                EmptyView()
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(hex: "2F2F2F"))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(hex: "404040"), lineWidth: 1)
        )
    }
}
