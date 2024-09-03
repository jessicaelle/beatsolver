//
//  ContentView.swift
//  BeatSolver
//
//  Created by Jessica Elle on 9/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var bpmInput: String = ""
    @State private var bpmColor: Color = .black
    @State private var showClearButton: Bool = false  // Centralized control for CLEAR button
    @State private var tapTimes: [Date] = []  // Move tapTimes to ContentView
    @State private var bpmAverage: Double = 0  // Move bpmAverage to ContentView

    
    
    var body: some View {
        ZStack {
            
            Color.clear
                .frame(maxWidth: .infinity, maxHeight: .infinity) // 100% of the screen
                .contentShape(Rectangle()) // Ensures the entire area is tappable
                .ignoresSafeArea()
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            VStack(spacing: 20) {
                
                Spacer()
                
                BPMInputView(bpmInput: $bpmInput, bpmColor: $bpmColor, onBPMChanged: { bpmInputUpdated() })

                BPMTapperView(bpmInput: $bpmInput, bpmColor: $bpmColor, onBPMChanged: { bpmInputUpdated() }, tapTimes: $tapTimes, bpmAverage: $bpmAverage)

                if showClearButton {
                    BPMClearView(bpmInput: $bpmInput, bpmColor: $bpmColor, showClearButton: $showClearButton, onClear: resetAll)
                }
                
                // Placeholder for Beat Guide
                Text("Beat Guide Placeholder")
                    .frame(height: 200)  // Adjust as necessary
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Spacer()

            }
            
            .padding()
            .ignoreKeyboard()
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    private func bpmInputUpdated() {
        showClearButton = !bpmInput.isEmpty
    }
    
    private func resetAll() {
            bpmInput = ""
            bpmColor = .black
            showClearButton = false
            tapTimes = []  // Clear tapTimes
            bpmAverage = 0  // Reset BPM average
        print("After reset - bpmInput: \(bpmInput), bpmColor: \(bpmColor), showClearButton: \(showClearButton), tapTimes: \(tapTimes.count), bpmAverage: \(bpmAverage)")
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
