import SwiftUI

struct ContentView: View {
    
@StateObject var todoManager = TodoManager()
    var body: some View {
        TabView{
            MainTodoListView(todoManager: todoManager)
                .tabItem{
                    Label("Todos", systemImage: "list.bullet.clipboard.fill")
                }
            HowManyMoreView(todoManager: todoManager)
                .tabItem{
                    Label("Tasks Remaining", systemImage: "number.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
