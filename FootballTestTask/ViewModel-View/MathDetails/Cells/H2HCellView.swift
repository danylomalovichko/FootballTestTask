//
//  H2HCellView.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 03.10.2023.
//

import Foundation
import SwiftUI

struct H2HCellView: View {
    @StateObject var vm: H2HCellVM
    
    var body: some View {
        VStack {
            HStack {
                Text(vm.h2h?.data ?? .init(), format: Date.FormatStyle(date: .numeric, time: .none))
                    .font(Font.SF.regular(size: 12))
                    .foregroundColor(.white.opacity(0.5))
                
                VStack {
                    HStack {
                        
                        Image(vm.h2h?.logoFirst ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        
                        Text(vm.h2h?.titleFirst ?? "")
                        
                        Spacer()
                        
                        Text(vm.h2h?.resultFirst ?? "")
                    }
                    
                    HStack {
                        
                        Image(vm.h2h?.logoSecond ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        
                        Text(vm.h2h?.titleSecond ?? "")
                        
                        Spacer()
                        
                        Text(vm.h2h?.resultSecond ?? "")
                    }
                }
            }
            .padding(.vertical, 10)
        }
    }
}
