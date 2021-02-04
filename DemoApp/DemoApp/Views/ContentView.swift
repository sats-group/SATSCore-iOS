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
                    Text("Fonts")
                    NavigationLink("Spacing", destination: EmptyView())
                }

                Section(header: Text("UIKit Basics")) {
                    NavigationLink("Labels", destination: SATSLabelDemoView())
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
