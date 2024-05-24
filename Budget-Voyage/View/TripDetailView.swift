//
//  TripDetailView.swift
//  Budget-Voyage
//
//  Created by Min Thu Khine on 5/24/24.
//

import SwiftUI
import SwiftData

struct TripDetailView: View {
    
    var selectedTrip: Trip
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(selectedTrip.tripName)
                .font(.largeTitle)
                .bold()
                .padding(.top, 20)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.blue)
                    Text(selectedTrip.place)
                        .font(.title2)
                }
                
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.green)
                    Text("Start Date: \(formattedDate(selectedTrip.startDate))")
                }
                
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.red)
                    Text("End Date: \(formattedDate(selectedTrip.endDate))")
                }
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Trip Details", displayMode: .inline)
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
