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
    
    // Shared Button Styles
    static let buttonFont: Font = .title2
    static let buttonCornerRadius: CGFloat = 10
    static let buttonMaxWidth: CGFloat = 240 // use .infinity for full width
    static let buttonHeight: CGFloat = 70

    // Tap Button Colors
    static let tapButtonColor: Color = .blue
    static let tapButtonTextColor: Color = .white

    // Clear Button Colors
    static let clearButtonColor: Color = .red
    static let clearButtonTextColor: Color = .white
    
}

