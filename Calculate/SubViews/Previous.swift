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
        Text("Yes")
    }
}
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
//}




#Preview {
    PreviousCalculations()
}
