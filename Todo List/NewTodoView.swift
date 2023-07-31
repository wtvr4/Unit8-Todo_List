import SwiftUI

struct NewTodoView: View {
    @State private var todoTitle = ""
    @State private var todoSubtitle = ""
    @Binding var sourceArray: [Todo]
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Form{
            Section("Info"){
                TextField("Title", text: $todoTitle)
                TextField("Subtitle", text: $todoSubtitle)
            }
            Section("Actions"){
                Button("Save"){
                    let todo = Todo(title: todoTitle, subtitle: todoSubtitle)
                    sourceArray.append(todo)
                    dismiss()
                }
                Button("Cancel", role: .destructive){
                    dismiss()
                }
            }
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(sourceArray: .constant([]))
    }
}
