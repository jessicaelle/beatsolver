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
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
                    .transition(.slide) // Optional: Add a slide transition for when the button appears
            }
            .padding(.top, 10)
        }
    }

    private func clearBPM() {
        bpmInput = ""
        bpmColor = .black // Reset to default color or any other initial color
        showClearButton = false
    }
}
