import SwiftUI
@_exported import SATSCore

@main
struct DemoAppApp: App {
    init() {
        SATSFont.registerCustomFonts()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
