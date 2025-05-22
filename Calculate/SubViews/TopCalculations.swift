//
//  TopCalculations.swift
//  Calculate
//
//  Created by Trey Gaines on 5/22/25.
//

import SwiftUI
import Observation

struct TopCalculations: View  {
    
    @Environment(Calculate.self) var curr
    var body: some View {
        ZStack {
            Rectangle().fill(Color(uiColor: UIColor(red: 225/255, green: 224/255, blue: 221/255, alpha: 1)))
                .cornerRadius(10, corners: .allCorners)
            VStack {
                Text("\(String(describing: curr.operand1))")
                Text("\(String(describing: curr.operand2))")
                Text("\(curr.operand1Str == "" ? "No 1st" : curr.operand1Str)")
                Text("\(curr.operand2Str == "" ? "No 2nd" : curr.operand2Str)")
                Text("\(curr.operation == "" ? "No op" : curr.operation)")
                Text("")
                if curr.resultPossible {
                    Text("\(String(describing: curr.operand1)) \(curr.operation) \(String(describing: curr.operand2)) = \(curr.result)")
                } else if curr.op1Exists {
                    Text("\(String(describing: curr.operand1)) \(curr.operation) \(curr.operand2Str)")
                } else {
                    if curr.operand1Str != "" {
                        Text("\(curr.operand1Str)")
                    } else { Text("0") }
                }
            }
        }
            
    }
}

#Preview {
    //@Previewable @Environment(Calculate.self) var currentCalculation
    TopCalculations()
        .environment(Calculate.init())
}

