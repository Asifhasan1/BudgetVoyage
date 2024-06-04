//
//  Budget_VoyageApp.swift
//  Budget-Voyage
//
//  Created by Asif on 5/16/24.
//

import SwiftUI
import SwiftData

@main
struct Budget_Voyage: App {
    //    let modelContainer: ModelContainer
    //
    //     init() {
    //            do {
    //                modelContainer = try ModelContainer(for: Trip.self)
    //            } catch {
    //                fatalError("Could not initialize ModelContainer")
    //            }
    //        }
    //
        var body: some Scene {
            WindowGroup {
                MainView()
            }
            .modelContainer(for: Trip.self)

        }
}
