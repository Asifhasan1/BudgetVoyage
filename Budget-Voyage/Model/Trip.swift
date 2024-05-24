//
//  Trip.swift
//  Budget-Voyage
//
//  Created by Min Thu Khine on 5/24/24.
//

import Foundation
import SwiftData

@Model
class Trip {
    
    var id: String
    let tripName: String
    let place: String
    let startDate: Date
    let endDate: Date
    let selectedDepositPlan: String
    
    init(tripName: String, place: String, startDate: Date, endDate: Date, selectedDepositPlan: String) {
        id = UUID().uuidString
        self.tripName = tripName
        self.place = place
        self.startDate = startDate
        self.endDate = endDate
        self.selectedDepositPlan = selectedDepositPlan
    }
}
