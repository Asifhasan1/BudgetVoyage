//
//  TripInformationFormView.swift
//  Budget-Voyage
//
//  Created by Min Thu Khine on 5/22/24.
//

import SwiftUI

struct TripInformationFormView: View {
    
    @State private var tripName = ""
    @State private var place = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    var depositPlans = ["Daily", "Weekly", "Monthly"]
    @State private var selectedDepositPlan = "Daily"
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("Name of Trip", text: $tripName)
                    
                    TextField("Place", text: $place)
                    
                    DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
    //                    .datePickerStyle(.graphical)
                        .padding()
                    
                    DatePicker("End Date", selection: $endDate, displayedComponents: .date)
    //                    .datePickerStyle(.graphical)
                        .padding()
                    
                    Picker("Deposit Plan", selection: $selectedDepositPlan) {
                        ForEach(depositPlans, id: \.self) { plan in
                            Text(plan)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                }
                .navigationTitle("Trip Information")
                
                Button(action: {
                    
                }, label: {
                    Text("Save")
                })
            }
        }
    }
}


#Preview {
    TripInformationFormView()
        .previewDevice("iPad Pro (11-inch)")
}
