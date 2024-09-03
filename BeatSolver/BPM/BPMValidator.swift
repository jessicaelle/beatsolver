//
//  BPMValidator.swift
//  BeatSolver
//
//  Created by Jessica Elle on 9/2/24.
//

import Foundation

struct BPMValidator {
    // Maximum allowed BPM value
    static let maxBPM: Double = 999.99

    // Validates and formats the BPM input
    static func validateBPMInput(_ input: String) -> String {
        // Filter out non-digit and non-decimal characters
        var filtered = input.filter { "0123456789.".contains($0) }
        
        // Check if there's already a decimal point in the filtered input
        let containsDecimal = filtered.contains(".")

        if !containsDecimal {
            // Limit the integer part to 3 digits if no decimal point is present
            if filtered.count > 3 {
                filtered = String(filtered.prefix(3))
            }
        } else {
            // Split into integer and decimal parts
            let parts = filtered.split(separator: ".", maxSplits: 1)
            let integerPart = String(parts[0].prefix(3)) // Limit integer part to 3 digits
            
            // If decimal exists, allow up to 2 decimal digits
            let decimalPart = parts.count > 1 ? String(parts[1].prefix(2)) : ""
            filtered = integerPart + "." + decimalPart
        }

        // Convert the string to Double to check against the max value
        if let bpmValue = Double(filtered), bpmValue > maxBPM {
            return String(format: "%.2f", maxBPM)
        } else {
            return filtered
        }
    }
}
