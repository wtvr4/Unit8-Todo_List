import SwiftUI

struct ContentView: View {
    
    @State private var todos = [
        Todo(title: "task 1", subtitle: "do it rn"),
        Todo(title: "task 2"),
        Todo(title: "task 3")
]
    
    var body: some View {
        NavigationStack {
            
                List($todos, id: \.id) { $todo in
                    NavigationLink{
                        TodoDetailView(todo: $todo)
                    } label: {
                        HStack{
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    todo.isCompleted.toggle()
                                }
                            VStack(alignment: .leading){
                                Text(todo.title)
                                    .strikethrough(todo.isCompleted)
                                if !todo.subtitle.isEmpty {
                                    Text(todo.subtitle)
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                        .strikethrough(todo.isCompleted)
                                }
                            }
                        }
                    }
            }
                .navigationTitle("Todo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
