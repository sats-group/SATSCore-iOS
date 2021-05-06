import SwiftUI

struct ExternalUrlDemoView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                demoView(title: "Opening Hours")
                demoView(title: "Terms and conditions")
                demoView(title: "Privacy policy")
            }
            .navigationTitle("ExternalUrlView")
        }.padding()
    }

    func demoView(title: String) -> some View {
        let viewData = ExternalUrlViewData(title: title, url: URL(string: "https://sats.com")!)
        let externalUrlView = ExternalUrlView()
        externalUrlView.configure(with: viewData)
        externalUrlView.onOpenUrl = { url in
            print("open \(url?.absoluteString ?? "") for \(title)")
        }
        return DemoWrapperView(view: externalUrlView)
    }
}

struct ExternalUrlDemoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                ExternalUrlDemoView()
            }

            NavigationView {
                ExternalUrlDemoView()
            }
            .environment(\.sizeCategory, .accessibilityExtraExtraLarge)

            NavigationView {
                ExternalUrlDemoView()
            }
            .environment(\.colorScheme, .dark)
        }
    }
}
