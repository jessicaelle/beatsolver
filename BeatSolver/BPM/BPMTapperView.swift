//
//  BPMTapperView.swift
//  BeatSolver
//
//  Created by Jessica Elle on 9/2/24.
//

import SwiftUI

struct BPMTapperView: View {
    @Binding var bpmInput: String
    @Binding var bpmColor: Color
    var onBPMChanged: () -> Void  // Closure to notify ContentView of BPM changes

    
    // Adds tapping logic from Math
    @State private var tapTimes: [Date] = []  // Use Date objects instead of TimeInterval
    @State private var bpmAverage: Double = 0

    
    var body: some View {
        Button(action: {
            registerTap()
        }) {
            Text("TAP")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 80)
                .background(bpmColor)
                .cornerRadius(10)
                .padding()
        }
    }
    
    private func registerTap() {
           let tapTime = Date()
           tapTimes.append(tapTime)

        if tapTimes.count < 4 {
            // Trigger flash effect via bpmColor if fewer than 4 taps
            flashBPMPlaceholder()
            print("Not enough taps yet: \(tapTimes.count)")
        } else if let calculatedBPM = Math.calculateBPM(tapTimes: &tapTimes, currentBPMAverage: &bpmAverage) {
            bpmInput = String(format: "%.2f", calculatedBPM)
            print("Calculated BPM: \(calculatedBPM)")
        } else {
            print("BPM calculation failed")
        }
    }
    
    private func flashBPMPlaceholder() {
        bpmColor = .red
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            bpmColor = .black // Reset to original color, adjust this as necessary
        }
    }
}

struct BPMTapperView_Previews: PreviewProvider {
    static var previews: some View {
        BPMTapperView(bpmInput: .constant("120"), bpmColor: .constant(.blue), onBPMChanged: {})
    }
}
