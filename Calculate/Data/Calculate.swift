//
//  Calculate.swift
//  Calculate
//
//  Created by Trey Gaines on 5/22/25.
//
import Observation

@Observable
class Calculate {
    //Operand 1 Types
    var operand1Str: String = ""
    var operand1IsNegative: Bool = false
    var operand1: Double? {
        if let num = Double(operand1Str) {
            return operand1IsNegative ? -1 * num : num
        } else { return nil }
    }
    
    //Operand 2 Types
    var operand2Str: String = ""
    var operand2IsNegative: Bool = false
    var operand2: Double? {
        if let num = Double(operand2Str) {
            return operand2IsNegative ? -1 * num : num
        } else { return nil }
    }
    
    //Operation
    var operation: String = ""
    
    
    var op1Exists: Bool {
        operand1 != nil
    }
    
    var op2Exists: Bool {
        operand2 != nil
    }
    
    var opExists: Bool {
        operation != ""
    }
    
    var resultPossible : Bool { op1Exists && op2Exists && opExists }
    
    
    
    var result: Double {
        var ans: Double = 0.0
        if let operand1 = operand1, let operand2 = operand2 {
            switch operation {
                case "%": ans = operand1.truncatingRemainder(dividingBy: operand2)
                case "+": ans = operand1 + operand2
                case "-": ans = operand1 - operand2
                case "x": ans = operand1 * operand2
                case "/": if operand2 == 0 { ans = 0.0 } else { ans = operand1 / operand2 }
                default: ans = 0.0
            }; return ans
        } else { return 0 }
    }
    
    func resetOp1() {
        operand1Str = ""
        operand1IsNegative = false
    }
    
    func resetOp2() {
        operand2Str = ""
        operand2IsNegative = false
    }
    
    func reset() {
        operation = ""
        operand1Str = ""
        operand1IsNegative = false
        operand2Str = ""
        operand2IsNegative = false
    }
}
