import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("DNA")) {
                    NavigationLink("Fonts", destination: SwiftUIFontsDemoView())
                    NavigationLink("Colors", destination: ColorDemoView())
                    NavigationLink("Spacing", destination: Text("⚠️ We should totally have constants here!"))
                }

                Section(header: Text("UIKit Basics")) {
                    NavigationLink("SATSLabel", destination: SATSLabelDemoView())
                    NavigationLink("SATSButton", destination: SATSButtonDemoView())
                    NavigationLink("SATSExternalUrlView", destination: SATSExternalUrlDemoView())
                    NavigationLink("SATSTopBar", destination: SATSTopBarDemoView())
                }

                Section(header: Text("UIKit Components")) {
                    NavigationLink("ArticlePageView", destination: ArticlePageViewDemo())
                }

                Section(header: Text("Components")) {
                    NavigationLink("InlineNoticeView", destination: InlineNoticeDemoView())
                    NavigationLink("ProgressLineView", destination: ProgressLineDemoView())
                }

                Section(header: Text("SwiftUI Demo")) {
                    NavigationLink("Header Concept", destination: DemoHeaderSampleView())
                    NavigationLink("Discover Concept", destination: DemoDiscoverView())
                }

                Section(header: Text("UIKit Demo")) {
                    NavigationLink("Basic Demo", destination: UIKitDemoView())
                    NavigationLink("Treatments Demo", destination: TreatmentsDemoView())
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("SATS Core Demo")

            Text("You can start by selecting a demo from the left side menu")
                .italic()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
