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
            Rectangle().fill(Color(uiColor: UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)))
                .cornerRadius(10, corners: .allCorners)
            
            VStack {
                HStack {
                    if curr.lastCalculation != "" {
                        Spacer(); Text(curr.lastCalculation).fontWeight(.semibold).padding()
                    } else {
                        Spacer(); Text("Make a calculation").fontWeight(.semibold).padding()
                    }
                }
                HStack { Spacer() }
                Text("\(curr.currentCalculation)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
            }
        }
            
    }
}

#Preview {
    //@Previewable @Environment(Calculate.self) var currentCalculation
    TopCalculations()
        .environment(Calculate.init())
}

