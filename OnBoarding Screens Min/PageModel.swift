//
//  PageModel.swift
//  Budget-Voyage
//
//  Created by Asif on 5/16/24.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "This is a sample description for debugging", imageUrl: "Trip", tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "Hello!", description: "Welcome to Budget Voyage, an app to help you plan and save for adventures of all kinds", imageUrl: "Logo", tag: 0),
    Page(name: "Begin", description: "To get a nice white card for your trip, tap the Add New Trip button", imageUrl: "Trip", tag: 1),
    Page(name: "Add Info & Save Your Trip!", description: "Fill out the trip information. When you are finished, tap save at the bottom", imageUrl: "Save", tag: 2),
    Page(name: "View Your Progress Bar", description: "Navigate to the Budget tab at the bottom of your screen and tap on the card you just created to view this progress bar", imageUrl: "SavedTrips", tag: 3),
    Page(name: "Travel Checklist", description: "Then navigate to the Checklist tab at the bottom of your screen. To add things to your list, tap on the + button at the top", imageUrl: "Travel", tag: 4),
    ]
    
}
