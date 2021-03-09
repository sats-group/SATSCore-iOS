import SwiftUI

struct SATSExternalUrlDemoView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                demoView(title: "Opening Hours", url: "https://sats.com")
                demoView(title: "Terms and conditions", url: "https://sats.com")
                demoView(title: "Privacy policy", url: "https://sats.com")
            }
            .navigationTitle("SATSExternalUrlView")
        }.padding()
    }

    func demoView(title: String, url: String) -> some View {
        let externalUrlView = SATSExternalUrlView()
        let viewData = SATSExternalUrlViewData(title: title, url: url)
        externalUrlView.configure(withViewData: viewData)
        return DemoWrapperView(view: externalUrlView)
    }
}

struct SATSExternalUrlDemoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                SATSExternalUrlDemoView()
            }

            NavigationView {
                SATSExternalUrlDemoView()
            }
            .environment(\.sizeCategory, .accessibilityExtraExtraLarge)

            NavigationView {
                SATSExternalUrlDemoView()
            }
            .environment(\.colorScheme, .dark)
        }
    }
}
