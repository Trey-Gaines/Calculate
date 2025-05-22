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
    
    
    init(timestamp: Date = .now, operation: String, result: Double) {
        self.timestamp = timestamp
        self.operation = operation
        self.result = result
    }
}
