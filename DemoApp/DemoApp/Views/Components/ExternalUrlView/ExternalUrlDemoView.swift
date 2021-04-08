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
        let externalUrlView = ExternalUrlView()
        externalUrlView.configure(title: title)
        externalUrlView.onOpenUrl = {
            print("open URL for \(title)")
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
