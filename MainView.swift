
//
//  MainView.swift
//  Budget Voyage Final
//
//  Created by Min Thu Khine on 6/3/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var trips: [Trip]
    
    var body: some View {
        TabView {
            CreateTripView()
                .tabItem {
                    Label("Trips", systemImage: "briefcase.circle")
                }
            
            BudgetTripListView()
                .tabItem {
                    Label("Budgets", systemImage: "dollarsign.square")
                }
            
            CheckListView()
                .tabItem {
                    Label("Checklists", systemImage: "list.bullet")
                }
        }
        .accentColor(Color.white) // Set the tab bar items color to white
        .background(Color(hex: "#582FFF")) // Set the tab bar background color
        .environment(\.colorScheme, .dark) // Set the color scheme to dark mode for preview
    }
}




#Preview {
    MainView()
}

