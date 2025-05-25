//
//  ContentView.swift
//  Calculate
//
//  Created by Trey Gaines on 5/22/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        NavigationStack {
            VStack {
                if UIDevice.current.userInterfaceIdiom == .pad {
                    VStack {
                        TopCalculations()
                        Keyboard()
                    }
                    .background(Color(uiColor: UIColor(red: 20/255, green: 20/255, blue: 20/255, alpha: 1)), ignoresSafeAreaEdges: .all)
                }
                
                if UIDevice.current.userInterfaceIdiom == .phone {
                    if horizontalSizeClass == .compact && verticalSizeClass == .regular {
                        //Portrait
                        VStack {
                            TopCalculations()
                            Keyboard()
                        }
                    }
                    else if verticalSizeClass == .compact {
                        //Landscape
                        HStack {
                            TopCalculations()
                                .frame(width: 330, height: 330)
                            Keyboard()
                        }
                        
                    }
                }
            }
            
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        PreviousCalculations()
                    } label: {
                        Image(systemName: "list.bullet")
                            .foregroundStyle(.blue)
                            .font(.headline)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Calculation.self, inMemory: true)
        .environment(Calculate.init())
}
