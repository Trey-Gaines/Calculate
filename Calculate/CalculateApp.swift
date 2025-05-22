//
//  CalculateApp.swift
//  Calculate
//
//  Created by Trey Gaines on 5/22/25.
//

import SwiftUI
import SwiftData

@main
struct CalculateApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Calculation.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(Color.black)
        }
        .modelContainer(sharedModelContainer)
    }
}
