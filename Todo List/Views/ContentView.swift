import SwiftUI

struct ContentView: View {
    
    @State private var todos = [
        Todo(title: "read", subtitle: "20 pages"),
        Todo(title: "water the plants"),
        Todo(title: "drink water")
    ]
    @State private var showAddSheet = false
    var body: some View {
        NavigationStack {
            List($todos, editActions: [.all]) { $todo in
                TodoRowView(todo: $todo)
            }
            .navigationTitle("Todo")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet){
                NewTodoView(sourceArray: $todos)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
