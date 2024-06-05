
import SwiftUI
import SwiftData

struct TaskItem: Identifiable {
    let id = UUID()
    var name: String
    var isCompleted: Bool = false
}

struct CheckListView: View {
    @State private var isAddCheckListSheetVisible = false
    @State private var tasks = [TaskItem]()
    @State private var isCompleteTaskAlert = false
    @State private var isAllTasksCompleted = false
    
    var completedTasks: Int {
        tasks.filter { $0.isCompleted }.count
    }
    
    var totalTasks: Int {
        tasks.count
    }
    
    var percentComplete: CGFloat {
        if tasks.isEmpty {
            return 0
        } else {
            return CGFloat(completedTasks) / CGFloat(totalTasks)
        }
    }
    
    var body: some View {
        ZStack {
            Color(hex: "#0B5351")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Travel Checklist")
                        .font(Font.custom("Hiragino Mincho ProN", size: 25))
                        .foregroundStyle(.white)
                        .padding()
                    
                    Spacer()
                    
                    Button(action: {
                        isAddCheckListSheetVisible = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.green)
                    }
                    .sheet(isPresented: $isAddCheckListSheetVisible) {
                        AddCheckListView(tasks: $tasks, sheetVisible: $isAddCheckListSheetVisible)
                    }
                    .padding()
                }
                .background(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.orange, lineWidth: 2))
                .padding()
                 
                ScrollView {
                    VStack {
                        ForEach(tasks) { item in
                            HStack {
                                Text(item.name)
                                    .font(.headline)  // Adding a font style
                                    .foregroundColor(.primary)  // Setting a primary color
                                    .padding(.leading, 10)  // Adding padding to the leading side
                                
                                Spacer()
                                
                                Button(action: {
                                    toggleCompletion(for: item)
                                    if completedTasks == totalTasks {
                                        isCompleteTaskAlert = true
                                    }
                                }) {
                                    Image(systemName: item.isCompleted ? "checkmark.square.fill" : "square")
                                        .resizable()  // Make the image resizable
                                        .frame(width: 24, height: 24)  // Setting a larger frame size
                                        .foregroundColor(item.isCompleted ? .green : .white)  // Color change based on completion
                                        .padding(10)  // Adding padding
                                        .background(Color.gray.opacity(0.1))  // Adding a subtle background
                                        .clipShape(Circle())
                                }
                                .accessibility(label: Text(item.isCompleted ? "Mark as incomplete" : "Mark as complete"))
                            }
                            .padding()  // Adding overall padding
                            .background(.gray)  // Adding a background color
                            .cornerRadius(25)  // Rounding the corners
                            .shadow(radius: 2)
                            
                            .background(.gray)
                        }
                         
                        .onMove(perform: move) 
                        //                    .onDelete(perform: deleteTask)
                        
                    }
                    .padding()
                    .listStyle(PlainListStyle())
                }
                
                Spacer()
            }
        }
    }
    
    func toggleCompletion(for task: TaskItem) {
        isAllTasksCompleted = false
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    //    func deleteTask(at offsets: IndexSet) {
    //        move(atOffsets: offsets)
    //    }
    
    func move(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
}

struct CheckListView_Previews: PreviewProvider {
    static var previews: some View {
        CheckListView()
    }
}
