//
//  TripInformationFormView.swift
//  Budget-Voyage
//
//  Created by Min Thu Khine on 5/22/24.
//

import SwiftUI
import SwiftData

struct TripInformationFormView: View {
    
    @Environment(\.modelContext) private var context
    
    @Query private var trips: [Trip]
    
    @State private var tripName = ""
    @State private var place = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    var depositPlans = ["Daily", "Weekly", "Monthly"]
    @State private var selectedDepositPlan = "Daily"
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Trip Details").font(.headline)) {
                    TextField("Name of Trip", text: $tripName)
                        .padding(.vertical, 10)
                    
                    TextField("Place", text: $place)
                        .padding(.vertical, 10)
                }
                
                Section(header: Text("Dates").font(.headline)) {
                    DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                    
                    DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                }
                
                Section(header: Text("Deposit Plan").font(.headline)) {
                    Picker("Deposit Plan", selection: $selectedDepositPlan) {
                        ForEach(depositPlans, id: \.self) { plan in
                            Text(plan)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    NavigationLink(destination: MainView()
                                    .onAppear(perform: saveTrip)
                                    .navigationBarBackButtonHidden(true)) {
                        Text("Save")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.vertical, 10)
                }
            }
            .navigationTitle("Trip Information")
        }
    }
    
    func saveTrip() {
        let trip = Trip(tripName: tripName, place: place, startDate: startDate, endDate: endDate, selectedDepositPlan: selectedDepositPlan)
        context.insert(trip)
    }
    
    func deleteItem(_ trip: Trip) {
        context.delete(trip)
    }
}

