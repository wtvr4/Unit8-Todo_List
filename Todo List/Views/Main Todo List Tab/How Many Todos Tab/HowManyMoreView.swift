import SwiftUI

struct HowManyMoreView: View {
    @ObservedObject var todoManager: TodoManager
    
    var body: some View {
        VStack {
            Text("You have:")
                .font(.largeTitle)
            Text("\(todoManager.numTodosLeft)")
                .font(.system(size: 140))
                .foregroundColor(.accentColor)
                .padding()
            Text(todoManager.numTodosLeft == 1 ? "todo left.": "todos left.")
                .font(.largeTitle)
            Text("You have completed ^[\(todoManager.numTodosDone) todos](inflect: true). Good job.")
                .padding(.top)
        }
    }
    
}

struct HowManyMoreView_Previews: PreviewProvider {
    static var previews: some View {
        HowManyMoreView(todoManager: TodoManager())
    }
}
