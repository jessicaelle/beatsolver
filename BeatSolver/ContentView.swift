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
                
                BPMInputView(bpmInput: $bpmInput, bpmColor: $bpmColor)
                
                Spacer()
                
                // Placeholder for BPM Tapper
                Text("BPM Tapper Placeholder")
                    .frame(height: 100)  // Adjust as necessary
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
