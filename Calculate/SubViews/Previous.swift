//
//  Previous.swift
//  Calculate
//
//  Created by Trey Gaines on 5/23/25.
//

import SwiftData
import Observation
import SwiftUI


struct PreviousCalculations: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var calculations: [Calculation]
    
    var body: some View {
        List {
            ForEach(calculations) { calculation in
                VStack {
                    HStack(alignment: .center) {
                        Text("\(calculation.operation) = \(String(format: "%.2f", calculation.result))")
                            .fontWeight(.semibold)
                            .font(.title3)
                    }
                    
                    HStack(alignment: .center) {
                        Text("\(calculation.timestamp)")
                    }
                }
                    
            }
            .onDelete { offset in
                for index in offset {
                    modelContext.delete(calculations[index])
                }
            }
        }
    }
}




#Preview {
    PreviousCalculations()
}
