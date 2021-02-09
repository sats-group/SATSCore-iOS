import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("DNA")) {
                    NavigationLink("Fonts", destination: SwiftUIFontsDemoView())
                    NavigationLink("Colors", destination: ColorDemoView())
                    NavigationLink("Spacing", destination: EmptyView())
                }

                Section(header: Text("UIKit Basics")) {
                    NavigationLink("SATSLabel", destination: SATSLabelDemoView())
                    NavigationLink("SATSButton", destination: SATSLabelDemoView())
                }

                Section(header: Text("Experimental Demo UI")) {
                    NavigationLink("Header", destination: DemoHeaderSampleView())
                    NavigationLink("Discover", destination: DemoDiscoverView())
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
