//
//  BPMInputView.swift
//  BeatSolver
//
//  Created by Jessica Elle on 9/2/24.
//

import SwiftUI

struct BPMInputView: View {
    @Binding var bpmInput: String
    @Binding var bpmColor: Color
    
    // Focus state to control when the TextField is focused
    @FocusState private var isFocused: Bool
    
    var body: some View {
        TextField("BPM", text: $bpmInput)
            .font(Styles.bpmFont)
            .multilineTextAlignment(.center)
            .foregroundColor(bpmColor)
            .background(Color(UIColor.systemBackground))
            .frame(width: 250, height: 80)
            .focused($isFocused) // Bind focus state
            .onTapGesture {
                isFocused = true  // Focus when tapped
            }
            .keyboardType(.decimalPad)
    }
}

struct BPMInputView_Previews: PreviewProvider {
    static var previews: some View {
        // Providing sample bindings for preview
        BPMInputView(bpmInput: .constant("999.99"), bpmColor: .constant(.black))
    }
}
