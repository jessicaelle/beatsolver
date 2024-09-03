//
//  BPMClearView.swift
//  BeatSolver
//
//  Created by Jessica Elle on 9/2/24.
//

// BPMClearView.swift
import SwiftUI

struct BPMClearView: View {
    @Binding var bpmInput: String
    @Binding var bpmColor: Color
    @Binding var showClearButton: Bool

    var body: some View {
        if showClearButton {
            Button(action: clearBPM) {
                Text("CLEAR")
                    .font(Styles.buttonFont) // Use shared font
                    .foregroundColor(Styles.clearButtonTextColor) // Use custom text color
                    .frame(maxWidth: Styles.buttonMaxWidth, maxHeight: Styles.buttonHeight) // Use shared frame size
                    .background(Styles.clearButtonColor) // Use custom background color
                    .cornerRadius(Styles.buttonCornerRadius) // Use shared corner radius
                    .transition(.slide)
            }
        }
    }

    private func clearBPM() {
        bpmInput = ""
        bpmColor = .black // Reset to default color or any other initial color
        showClearButton = false
    }
}
