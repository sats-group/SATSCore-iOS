//
//  DemoAppApp.swift
//  DemoApp
//
//  Created by Felipe Espinoza on 19/01/2021.
//

import SwiftUI
import SATSCore

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
