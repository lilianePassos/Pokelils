import SwiftUI

@main
struct PokelilsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(items: [ResultListItem]())
        }
    }
}
