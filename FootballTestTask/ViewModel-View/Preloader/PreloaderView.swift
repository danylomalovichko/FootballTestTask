//
//  PreloaderView.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 02.10.2023.
//

import SwiftUI

struct PreloaderView: View {
    
    @AppStorage("isLoading") var isLoading: Bool = true
    @State private var drawingStroke = false
    
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    let animation = Animation
        .easeOut(duration: 5)
        .delay(0.3)
    
    var body: some View {
        ZStack {
            Image("PreloaderBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)
                .background(.white)
            
            Ring(Color(hex: "#2B8A64"))
                .frame(width: 66)
            
        }
        .onReceive(timer) { _ in
            isLoading = false
        }
        .animation(animation, value: drawingStroke)
        .onAppear {
            drawingStroke.toggle()
        }
        .preferredColorScheme(.light)
    }
}


extension PreloaderView {
    func Ring(_ color: Color) -> some View {
        // Background ring
        Circle()
            .stroke(style: StrokeStyle(lineWidth: 3))
            .foregroundStyle(.tertiary)
            .overlay {
                // Foreground ring
                Circle()
                    .trim(from: 0, to: drawingStroke ? 1 : .leastNonzeroMagnitude)
                    .stroke(color.gradient,
                            style: StrokeStyle(lineWidth: 3, lineCap: .round))
                
            }
            .rotationEffect(.degrees(-90))
    }
}

