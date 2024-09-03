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
    var onBPMChanged: () -> Void  // Closure to notify ContentView of BPM changes
    
    // Focus state to control when the TextField is focused
    @FocusState private var isFocused: Bool
    
    var body: some View {
        TextField("", text: $bpmInput)
            .placeholder(when: bpmInput.isEmpty, alignment: .center) { // Set alignment to center
                Text("BPM")
                    .font(Styles.bpmFont)
                    .foregroundColor(bpmColor) // Color controlled externally
            }
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
            .onChange(of: bpmInput) { newValue in
                bpmInput = BPMValidator.validateBPMInput(newValue)
                onBPMChanged()  // Notify ContentView that BPM has changed
            }
    }
}

extension View {
    // Custom modifier for displaying a placeholder
    func placeholder<Content: View>(when shouldShow: Bool, alignment: Alignment = .center, @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            if shouldShow { placeholder() } // Display placeholder when input is empty
            self
        }
    }
}

struct BPMInputView_Previews: PreviewProvider {
    static var previews: some View {
        // Providing sample bindings for preview
        BPMInputView(bpmInput: .constant("999.99"), bpmColor: .constant(.black), onBPMChanged: {})
    }
}
