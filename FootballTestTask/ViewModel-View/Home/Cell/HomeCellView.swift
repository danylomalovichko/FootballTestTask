//
//  HomeCellView.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 02.10.2023.
//

import SwiftUI

struct HomeCellView: View {
    @EnvironmentObject var router: Router
    @StateObject var vm: HomeCellVM
    
    var body: some View {
        Button {
            if let match = vm.match {
                router.navigate(to: .mathDetail(matchID: match.id))
            }
        } label: {
            VStack {
                
                Spacer()
                
                HStack {
                    VStack {
                        Image(vm.match?.logoOneName ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 69, height: 69)
                        
                        Text(vm.match?.teamOneTitle ?? "")
                            .font(Font.SF.regular(size: 16))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            Group {
                                Text("\(vm.match?.resultOne ?? 0)")
                                    .foregroundColor(vm.match?.resultOne ?? 0 > vm.match?.resultSecond ?? 0 ? .white : .white.opacity(0.5))
                                +
                                Text(" : ")
                                    .foregroundColor(.white)
                                +
                                Text("\(vm.match?.resultSecond ?? 0)")
                                    .foregroundColor(vm.match?.resultSecond ?? 0 > vm.match?.resultOne ?? 0 ? .white : .white.opacity(0.5))
                            }
                            .font(Font.SF.regular(size: 32))
                        }
                        
                        Text((vm.match?.time ?? "") + "`" )
                            .font(Font.SF.regular(size: 17))
                            .foregroundColor(Color(hex: "#36AA7B"))
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(vm.match?.logoSecondName ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 69, height: 69)
                        
                        Text(vm.match?.teamSecondTitle ?? "")
                            .font(Font.SF.regular(size: 16))
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 12)
                .padding(.horizontal, 24)
                
                Spacer()
                
                HStack {
                    
                    Text(vm.match?.date ?? .init(), format: Date.FormatStyle(date: .none, time: .shortened))
                        .font(Font.SF.regular(size: 12))
                        .foregroundColor(.white.opacity(0.5))
                        .padding(.horizontal, 24)
                        .padding(.bottom, 12)

                    Spacer()
                                        
                    Image("CellArrow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 58, height: 52)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 148)
            .background(Color(hex: "2F2F2F"))
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(hex: "404040"), lineWidth: 1)
            )
            .padding(.horizontal, 13)
        }
    }
}
