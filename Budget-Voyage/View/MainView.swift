//
//  MainView.swift
//  Budget-Voyage
//
//  Created by Min Thu Khine on 5/24/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var trips: [Trip]
    
    var body: some View {
        NavigationStack {
            
            VStack {
                List {
                    ForEach(trips) { trip in
                        NavigationLink {
                            TripDetailView(selectedTrip: trip)
                        } label: {
                            Text(trip.tripName)
                        }
                    }
                    .onDelete { indexes in
                        for index in indexes {
                            deleteItem(trips[index])
                        }
                    }
                }
                
                NavigationLink {
                    TripInformationFormView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Create a new trip")
                }
            }
            
        }
    }
    
    func deleteItem(_ trip: Trip) {
        context.delete(trip)
    }
}
