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
    var onClear: () -> Void  // New closure to handle full reset


    var body: some View {
        if showClearButton {
            Button(action: {
                print("Clear button pressed.")
                onClear()  // Call the reset function in ContentView
            }) {
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
}
