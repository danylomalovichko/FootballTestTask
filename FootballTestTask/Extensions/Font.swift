//
//  Font.swift
//  FootballTestTask
//
//  Created by Danylo Malovichko on 02.10.2023.
//

import SwiftUI

extension Font {
    
    struct SF {
        static func regular(size: CGFloat) -> Font {
            .custom("SFPro-Regular", size: size)
        }
        
        static func medium(size: CGFloat) -> Font {
            .custom("SFPro-Medium", size: size)
        }
        
        static func bold(size: CGFloat) -> Font {
            .custom("SFPro-Bold", size: size)
        }
        
        static func displayBold(size: CGFloat) -> Font {
            .custom("SFProDisplay-Bold", size: size)
        }
        
        static func displaySemibold(size: CGFloat) -> Font {
            .custom("SFProDisplay-Semibold", size: size)
        }
    }
}
