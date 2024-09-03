//
//  Math.swift
//  BeatSolver
//
//  Created by Jessica Elle on 9/2/24.
//

import Foundation

struct Math {
    
    // Maximum size of tap times to keep track of
    static let maxTapTimesCount: Int = 10
    
    // Filter outlier factor (e.g., 1.5 means 50% above or below the current average BPM)
    static let outlierFactor: Double = 1.5

    // Calculate the BPM based on an array of tap intervals and a current BPM average
    static func calculateBPM(tapTimes: inout [TimeInterval], tapTime: TimeInterval, currentBPMAverage: inout Double) -> Double? {
        if let lastTapTime = tapTimes.last {
            let interval = tapTime - lastTapTime
            let bpm = 60 / interval

            // Filter out outliers
            if bpm > currentBPMAverage * (1.0 / outlierFactor) && bpm < currentBPMAverage * outlierFactor {
                tapTimes.append(tapTime)
                if tapTimes.count > maxTapTimesCount {
                    tapTimes.removeFirst()
                }

                // Calculate a weighted average
                let totalWeight = Double(tapTimes.count)
                currentBPMAverage = currentBPMAverage * ((totalWeight - 1) / totalWeight) + bpm / totalWeight
            } else {
                // If the BPM is an outlier, we don't consider it for the average
                return currentBPMAverage
            }
        } else {
            tapTimes.append(tapTime)
            currentBPMAverage = 60 // Default BPM if this is the first tap
        }

        return currentBPMAverage
    }

    // Other beat grid calculations (e.g., double time, half time) can stay as they are...
    static func doubleTime(bpm: Double) -> Double {
        return bpm * 2
    }

    static func halfTime(bpm: Double) -> Double {
        return bpm / 2
    }
}
