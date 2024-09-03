import Foundation

struct Math {
    static let maxTapTimesCount: Int = 10
    static let outlierFactor: Double = 1.5

    // Calculate the BPM based on an array of tap times and the current BPM average
    static func calculateBPM(tapTimes: inout [Date], currentBPMAverage: inout Double) -> Double? {
        guard tapTimes.count >= 4 else {
            print("Not enough taps yet: \(tapTimes.count)")
            return nil
        }

        if tapTimes.count > maxTapTimesCount {
            tapTimes.removeFirst()
        }

        let intervals = zip(tapTimes.dropLast(), tapTimes.dropFirst()).map { $1.timeIntervalSince($0) }
        guard !intervals.isEmpty else {
            print("Intervals array is empty")
            return nil
        }

        let averageInterval = intervals.reduce(0, +) / Double(intervals.count)
        let bpm = 60 / averageInterval

        // Adjust the initial average to prevent it from being treated as an outlier
        if currentBPMAverage == 0 {
            currentBPMAverage = bpm
        }

        // Adjust the outlier detection logic
        if bpm > currentBPMAverage * (1.0 / outlierFactor) && bpm < currentBPMAverage * outlierFactor {
            print("Valid BPM: \(bpm)")
            let totalWeight = Double(tapTimes.count)
            currentBPMAverage = currentBPMAverage * ((totalWeight - 1) / totalWeight) + bpm / totalWeight
        } else {
            print("Outlier detected. Current BPM average: \(currentBPMAverage)")
            return currentBPMAverage
        }

        return currentBPMAverage
    }
}
