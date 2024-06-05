
import SwiftUI

struct TripDetailView: View {
    
    var selectedTrip: Trip

    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                Text(selectedTrip.tripName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)

                HStack {
                    Text("Place:")
                        .font(.headline)
                    Spacer()
                    Text(selectedTrip.place)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Start Date:")
                        .font(.headline)
                    Spacer()
                    Text(dateFormatter.string(from: selectedTrip.startDate))
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("End Date:")
                        .font(.headline)
                    Spacer()
                    Text(dateFormatter.string(from: selectedTrip.endDate))
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Total Budget:")
                        .font(.headline)
                    Spacer()
                    Text("$\(String(format: "%.2f", selectedTrip.budgetTotal))")
                        .font(.body)
                        .foregroundColor(.secondary)
                }

                HStack {
                    Text("Accommodation:")
                        .font(.headline)
                    Spacer()
                    Text(selectedTrip.accommodation ?? "Something")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Transportation:")
                        .font(.headline)
                    Spacer()
                    Text(selectedTrip.transportation ?? "Something")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                VStack(alignment: .leading) {
                    Text("Notes:")
                        .font(.headline)
                        .padding(.bottom, 5)
                    Text(selectedTrip.notes ?? "Something")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.all, 10)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)
                }
                
                Spacer()
            }
            .padding()
//            .background(Color(hex: "#C2E7DA"))
            .cornerRadius(15)
            .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 5)
            .padding()
        }
        
        .background(Color(hex: "#0B5351"))
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

//struct TripDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TripDetailView(selectedTrip: Trip(tripName: "Summer Vacation", place: place, startDate: startDate, endDate: endDate, budgetTotal: budgetTotal, accommodation: accomodation, transportation: transportation, notes: note)))
//    }
//}
