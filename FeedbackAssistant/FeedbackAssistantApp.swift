import SwiftUI

@main
struct FeedbackAssistantApp: App {
    @StateObject var dataController =  DataController() // Stays alive for the whole duration of the app
    
    var body: some Scene {
        WindowGroup {
            NavigationSplitView() {
                SidebarView()
            } content: {
                ContentView()
            } detail: {
                DetailView()
            }
            .environment(\.managedObjectContext, dataController.container.viewContext) // Allows any child view to access CoreData with `@Environment(\.managedObjectContext) var managedObjectContext`
            .environmentObject(dataController)
        }
    }
}
