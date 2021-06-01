import SwiftUI

struct LoadingDemoView: View {
    var loadingView: UIView {
        let view = LoadingView()
        view.backgroundColor = .backgroundPrimary
        view.startAnimating()
        return view
    }

    var body: some View {
        DemoWrapperView(view: loadingView)
            .navigationTitle("LoadingView")
    }
}

struct LoadingViewPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                LoadingDemoView()
            }

            NavigationView {
                LoadingDemoView()
            }
            .colorScheme(.dark)
        }
    }
}
