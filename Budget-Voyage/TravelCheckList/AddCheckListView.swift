import SwiftUI
import SwiftData

struct AddCheckListView: View {
    @State private var task = ""
    @Binding var tasks: [TaskItem]
    @Binding var sheetVisible: Bool
    
    var body: some View {
      
            VStack {
                    Spacer()
                    TextField("Enter your tasks and press return.", text: $task)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.blue, lineWidth: 2))
                        .padding(.horizontal, 30)
                    
                    List {
                        ForEach(tasks) { item in
                            Text(item.name)
                        }
                    }
                    
                    Button(action: {
                        sheetVisible = false
                    }) {
                        Text("Done")
                            .font(Font.custom("Hiragino Mincho ProN", size: 25))
                            .padding(20)
                            .background(Color(hex: "BDC487"))
                            .foregroundColor(.white)
                            .cornerRadius(80)
                    }
                }
                .onSubmit {
                    addTask()
            }
        
    }
    
    func addTask() {
        tasks.append(TaskItem(name: task))
        task = ""
    }
}

struct AddCheckListView_Previews: PreviewProvider {
    static var previews: some View {
        AddCheckListView(tasks: .constant([]), sheetVisible: .constant(true))
    }
}


//#Preview {
//    AddCheckListView()
//}
