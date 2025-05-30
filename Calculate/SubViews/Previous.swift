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
                VStack(alignment: .center, spacing: 5) {
                    Text("\(calculation.operation) = \(String(format: "%.2f", calculation.result))")
                        .fontWeight(.bold)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text("\(calculation.time)")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .center)
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
