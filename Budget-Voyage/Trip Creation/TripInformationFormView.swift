//
//  TripInformationFormView.swift
//  Budget Voyage Final
//
//  Created by Min Thu Khine on 6/3/24.
//

import SwiftUI
import SwiftData

struct TripInformationFormView: View {
    
    @Environment(\.modelContext) var context
    @Query var trips: [Trip]
    @State private var tripName = ""
    @State private var place = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    var depositPlans = ["Daily", "Weekly", "Monthly"]
    @State private var selectedDepositPlan = "Daily"
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage? = nil
    @State private var budgetTotal = ""
    @State private var accomodation = ""
    @State private var note = ""
    @State private var transportation = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0B5351")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                            VStack {
                                HStack {
                                    Image("tripInfo")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .background(Color.purple)
                                        .clipShape(Circle())
                                    VStack(alignment: .leading) {
                                        Text("Trip Information")
                                            .font(.title)
                                            .fontWeight(.bold)
                                        Text("Please set up your trip details")
                                            .font(.subheadline)
                                    }
                                }
                                .padding()
                            }
                            
                            
                            VStack {
                                
                                TextField("", text: $tripName)
                                    .placeholder(when: tripName.isEmpty, placeholder: "Name of the trip", placeholderColor: .gray)
                                    .underlineTextField()
                                
                                TextField("", text: $place)
                                    .placeholder(when: place.isEmpty, placeholder: "Place", placeholderColor: .gray)
                                    .underlineTextField()
                                   
                                
                                DatePicker(
                                    "Start Date",
                                    selection: $startDate,
                                    in: Date()..., // This restricts the date to today and future dates
                                    displayedComponents: [.date]
                                )
                                
                                DatePicker(
                                    "End Date",
                                    selection: $endDate,
                                    in: Date()..., // This restricts the date to today and future dates
                                    displayedComponents: [.date]
                                )
                                
                                VStack {
                                    //                    if let selectedImage = selectedImage {
                                    //                        Image(uiImage: selectedImage)
                                    //                            .resizable()
                                    //                            .scaledToFit()
                                    //                            .frame(height: 200)
                                    //                    } else {
                                    //                        Text("No Image Selected")
                                    //                            .foregroundColor(.gray)
                                    //                    }
                                    
                                    //                    Button(action: {
                                    //                        isShowingImagePicker = true
                                    //                    }) {
                                    //                        Text("Upload Image")
                                    //                            .padding()
                                    //                            .background(Color.blue)
                                    //                            .foregroundColor(.white)
                                    //                            .cornerRadius(8)
                                    //                    }
                                    //                    .padding()
                                    //                    .sheet(isPresented: $isShowingImagePicker, onDismiss: addSelectedImage) {
                                    //                        ImagePicker(selectedImage: $selectedImage)
                                    //                    }
                                }
                                 
                                TextField("", text: $budgetTotal)
                                    .placeholder(when: budgetTotal.isEmpty, placeholder: "Amount to Save", placeholderColor: .gray)
                                    .keyboardType(.numberPad)
                                    .underlineTextField()
                                   
                                TextField("", text: $accomodation)
                                    .placeholder(when: accomodation.isEmpty, placeholder: "Accomodation", placeholderColor: .gray)
                                    .underlineTextField()
                                
                                TextField("", text: $note)
                                    .placeholder(when: note.isEmpty, placeholder: "Note", placeholderColor: .gray)
                                    .underlineTextField()
                                
                                
                                  
                                TextField("", text: $transportation)
                                    .placeholder(when: transportation.isEmpty, placeholder: "Transportation", placeholderColor: .gray)
                                    .underlineTextField()
                                
                                NavigationLink(destination: CreateTripView()
                                    .navigationBarBackButtonHidden(true)) {
                                        AddNewTripButton(icon: "checkmark", text: "Save")
                                    }
                                    .simultaneousGesture(TapGesture().onEnded {
                                        saveTrip()
                                    })
                            }
                            .padding()
                    }
                }
                
            }
        }
    }
    
    func saveTrip() {
        let trip = Trip(tripName: tripName, place: place, startDate: startDate, endDate: endDate, budgetTotal: budgetTotal, accommodation: accomodation, transportation: transportation, notes: note)
        context.insert(trip)
    }
    
    func deleteItem(_ trip: Trip) {
        context.delete(trip)
    }
    
    private func addSelectedImage() {
        //        if let selectedImage = selectedImage {
        //            images.append(selectedImage)
        //        }
    }
}

#Preview {
    TripInformationFormView()
}
