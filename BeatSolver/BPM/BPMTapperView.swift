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
    
    var body: some View {
        Button(action: {
            // Action to be defined later
            print("TAP button pressed")
        }) {
            Text("TAP")
                .font(.title)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 80)
                .background(bpmColor)
                .cornerRadius(10)
                .padding()
        }
    }
}

struct BPMTapperView_Previews: PreviewProvider {
    static var previews: some View {
        BPMTapperView(bpmInput: .constant("120"), bpmColor: .constant(.blue))
    }
}
