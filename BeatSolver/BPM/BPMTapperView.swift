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
    @Binding var tapTimes: [Date]
    @Binding var bpmAverage: Double
    
    var body: some View {
        Button(action: {
            registerTap()
        }) {
            Text("TAP")
                .font(Styles.buttonFont) // Use shared font
                .foregroundColor(Styles.tapButtonTextColor) // Use custom text color
                .frame(maxWidth: Styles.buttonMaxWidth, maxHeight: Styles.buttonHeight) // Use shared frame size
                .background(Styles.tapButtonColor) // Use custom background color
                .cornerRadius(Styles.buttonCornerRadius) // Use shared corner radius
        }
    }
    
    private func registerTap() {
           let tapTime = Date()
           tapTimes.append(tapTime)
        
        print("Current tapTimes count: \(tapTimes.count)")


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
        BPMTapperView(bpmInput: .constant("120"), bpmColor: .constant(.blue), onBPMChanged: {},tapTimes: .constant([]), bpmAverage: .constant(0.0))
    }
}
