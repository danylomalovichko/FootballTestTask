//
//  MathDetailView.swift
//  FootballTestTask
//
//  Created by ovr on 29.09.2023.
//

import SwiftUI

struct MathDetailView: View {
        
    @State var math: Match
    
    var body: some View {
        Text(math.title)
        Text(math.result)
    }
       
}

