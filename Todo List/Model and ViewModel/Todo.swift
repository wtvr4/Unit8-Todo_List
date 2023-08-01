import Foundation

struct Todo: Identifiable, Codable {
    let id = UUID()
    var title: String
    var subtitle = ""
    var isCompleted = false
}
