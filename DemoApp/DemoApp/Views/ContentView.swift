//
//  ContentView.swift
//  DemoApp
//
//  Created by Felipe Espinoza on 19/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("DNA")) {
                    NavigationLink("Fonts", destination: EmptyView())
                    NavigationLink("Colors", destination: ColorsView())
                    Text("Spacing")
                }

                Section(header: Text("UIKit Basics")) {
                    NavigationLink("Labels", destination: SATSLabelDemoView())
                    NavigationLink("Buttons", destination: SATSButtonDemoView())
                }
            }
            .navigationTitle("SATS Core Demo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
