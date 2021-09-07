import SwiftUI

struct PullToRefreshContainerDemoView: View {
    @State private var isLoading: Bool = false

    var body: some View {
        GeometryReader { proxy in
            PullToRefreshContainer(isLoading: isLoading, onReload: fauxReload) {
                Color.blue
                    .frame(height: proxy.size.height * 1.2)
            }
        }
        .navigationTitle("PullToRefreshContainer")
    }

    func fauxReload() {
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                isLoading = false
            }
        }
    }
}

struct PullToRefreshContainerDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PullToRefreshContainerDemoView()
        }
    }
}
