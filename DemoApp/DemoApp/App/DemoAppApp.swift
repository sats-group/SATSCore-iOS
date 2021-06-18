import SwiftUI
@_exported import SATSCore

@main
struct DemoAppApp: App {
    init() {
        Config.setup()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
