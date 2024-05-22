//
//  Budget_VoyageApp.swift
//  Budget-Voyage
//
//  Created by Asif on 5/16/24.
//

import SwiftUI

@main
struct Budget_Voyage: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
//            if isOnboarding {
//                OnBoardingView()
//            } else {
//                SplashScreenView()
//            }
            TripInformationFormView()
        }
    }
}
