import Foundation

struct Filter: Identifiable, Hashable {
    var id: UUID
    var name: String
    var icon: String
    var minModificationDate = Date.distantPast
    var tag: Tag?
    
    static var all = Filter(
        id: UUID(),
        name: "All Issues",
        icon: "tray"
    )
    static var recent = Filter(
        id: UUID(),
        name: "Recent issues",
        icon: "clock",
        minModificationDate: .now.addingTimeInterval(-7 * 86400) // 7 days ago
    )
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Filter, rhs: Filter) -> Bool {
        lhs.id == rhs.id
    }
}
