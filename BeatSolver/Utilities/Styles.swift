//
//  Styles.swift
//  BeatSolver
//
//  Created by Jessica Elle on 9/2/24.
//

import SwiftUI

struct Styles {

    // BPM Styles
    static let bpmColor: Color = .black
    static let bpmFontSize: CGFloat = 70
    
    // Using system font for now - fix when ready to swap with custom.
    static var bpmFont: Font {
        return Font.system(size: bpmFontSize, weight: .bold)
    }
    
}

