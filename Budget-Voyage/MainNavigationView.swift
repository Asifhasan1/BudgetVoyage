//
//  MainNavigationView.swift
//  Budget-Voyage
//
//  Created by Asif on 5/16/24.
//

import SwiftUI

struct MainNavigationView: View {
    var body: some View {
        
        NavigationStack {
            TabView {
                    TripsView()
                        .tabItem {
                            Label("Trips", systemImage: "airplane")
                        }

                    BudgetView()
                        .tabItem {
                            Label("Budget", systemImage: "dollarsign.square")
                        }

                    ListsTripsView()
                        .tabItem {
                            Label("Lists", systemImage: "list.bullet")
                        }
            }
        }
        }
    }



#Preview {
    MainNavigationView()
}

