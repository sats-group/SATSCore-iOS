import SwiftUI
@_exported import SATSCore

@main
struct DemoApp: App {
    init() {
        Config.setup()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
