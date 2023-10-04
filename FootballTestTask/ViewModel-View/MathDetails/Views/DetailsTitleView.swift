//
//  DetailsTitleView.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 02.10.2023.
//

import SwiftUI

struct DetailsTitleView: View {
    
    @Binding var match: Match?
    
    var body: some View {
        VStack {
            Text("League: ")
                .font(Font.SF.regular(size: 12))
                .foregroundColor(.white) +
            Text(match?.league ?? "")
                .foregroundColor(Color(hex: "2B8A64"))
                .font(Font.SF.regular(size: 12))

            HStack {
                VStack {
                    Image(match?.logoOneName ?? "")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 69, height: 69)
                    
                    Text(match?.teamOneTitle ?? "")
                        .font(Font.SF.regular(size: 16))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                VStack {
                    HStack {
                        Group {
                            Text("\(match?.resultOne ?? 0)")
                                .foregroundColor(match?.resultOne ?? 0 > match?.resultSecond ?? 0 ? .white : .white.opacity(0.5))
                            +
                            Text(" : ")
                                .foregroundColor(.white)
                            +
                            Text("\(match?.resultSecond ?? 0)")
                                .foregroundColor(match?.resultSecond ?? 0 > match?.resultOne ?? 0 ? .white : .white.opacity(0.5))
                        }
                        .font(Font.SF.regular(size: 32))
                    }
                    
                    Text((match?.time ?? "") + "`" )
                        .font(Font.SF.regular(size: 17))
                        .foregroundColor(Color(hex: "#36AA7B"))
                }
                
                Spacer()
                
                VStack {
                    Image(match?.logoSecondName ?? "")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 69, height: 69)
                    
                    Text(match?.teamSecondTitle ?? "")
                        .font(Font.SF.regular(size: 16))
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
            
            HStack {
                Text(match?.date ?? .init(), format: Date.FormatStyle(date: .none, time: .shortened))
                    .font(Font.SF.regular(size: 12))
                    .foregroundColor(.white.opacity(0.5))
                
                Spacer()
                
                Text(match?.date ?? .init(), format: Date.FormatStyle(date: .abbreviated, time: .none))
                    .font(Font.SF.regular(size: 12))
                    .foregroundColor(.white.opacity(0.5))

            }
            .padding(.horizontal, 24)
        }
        .padding(.vertical, 10)
        .background {
                RoundedRectangle(cornerRadius: 20)
                .fill(Color(hex: "404040"))
        }
    }
}

