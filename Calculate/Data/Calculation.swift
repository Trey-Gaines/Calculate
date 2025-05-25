//
//  Calculation.swift
//  Calculate
//
//  Created by Trey Gaines on 5/22/25.
//

import Foundation
import SwiftData

@Model
final class Calculation {
    var timestamp: Date
    var operation: String
    var result: Double
    var time: String
    
    init(timestamp: Date = Date.now, operation: String, result: Double, time: String = "") {
        self.timestamp = timestamp
        self.operation = operation
        self.result = result
        
        
        let dateFormatter = DateFormatter()
        DateFormatter().dateFormat = "MMM dd, yyyy"
        self.time = dateFormatter.string(from: timestamp)
        
    }
}
