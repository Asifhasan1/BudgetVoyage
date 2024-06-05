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
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
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
                if isOnboarding {
                    OnBoardingView()
                } else {
                    SplashScreenView()
                }
            }
            .modelContainer(for: Trip.self)

        }
}
