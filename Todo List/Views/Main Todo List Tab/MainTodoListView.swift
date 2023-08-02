import SwiftUI

struct MainTodoListView: View {
    @State private var showAddSheet = false
    @State private var showConfirmAlert = false
    @ObservedObject var todoManager: TodoManager
    var body: some View {
        NavigationStack {
            List($todoManager.todos, editActions: [.all]) { $todo in
                TodoRowView(todo: $todo)
            }
            .navigationTitle("Todo")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItemGroup(placement: .navigationBarTrailing){
//                    Button{
//                        showConfirmAlert = true
//                    } label: {
//                        Image(systemName: "list.bullet.clipboard.fill")
//                    }
                    Button{
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet){
                NewTodoView(sourceArray: $todoManager.todos)
            }
            .alert("Load sample data? Warning: This cannot be undone!", isPresented: $showConfirmAlert) {
                Button("Replace", role: .destructive) {
                    todoManager.loadSampleData()
                }
            }
        }

    }
}

struct MainTodoListView_Previews: PreviewProvider {
    static var previews: some View {
        MainTodoListView(todoManager: TodoManager())
    }
}
