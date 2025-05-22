//
//  ContentView.swift
//  Calculate
//
//  Created by Trey Gaines on 5/22/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    var body: some View {
        NavigationStack {
            Spacer()
            Grid {
                TopCalculations()
                Keyboard()
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("Yes")
                    } label: {
                        Image(systemName: "list.bullet")
                            .foregroundStyle(.blue)
                            .font(.headline)
                    }
                    .padding(.all, 0)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print("Yes")
                    } label: {
                        Image(systemName: "gear")
                            .foregroundStyle(.blue)
                            .font(.headline)
                    }
                    .padding(.all, 0)
                }
            }
        } //.background(Color.black)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Calculation.self, inMemory: true)
        .environment(Calculate.init())
}
