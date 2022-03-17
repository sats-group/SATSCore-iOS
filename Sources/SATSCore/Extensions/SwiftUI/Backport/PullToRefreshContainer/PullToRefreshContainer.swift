import SwiftUI

extension Backported {
    /// A custom pull-to refresh container intended to be used for iOS 14.
    /// The content's height will be set at least to the height of the parent of this container
    ///
    /// Example:
    ///
    /// ```swift
    /// PullToRefreshContainer(isLoading: value, onReaload: fetchData) {
    ///     MyCustomList()
    /// }
    /// ```
    @available(iOS,
        deprecated: 15,
        message: "This was a backport of the modifier for pull to refresh, now you should use the modifiers on list"
    )
    struct PullToRefreshContainer<Content: View>: View {
        @State private var scrollValue: CGFloat = 0
        @State private var isLoading: Bool = false
        var onReload: () async -> Void
        @ViewBuilder var content: Content

        private let progressHeight: CGFloat = 50

        public var body: some View {
            GeometryReader { proxy in
                ZStack {
                    Color.clear

                    VStack {
                        ProgressView()
                            .padding()

                        Spacer()
                    }

                    ScrollReaderView(scrollValue: $scrollValue, showsIndicators: false) {
                        content
                            .frame(minHeight: proxy.size.height)
                            .offset(x: 0, y: isLoading ? progressHeight : 0)
                    }
                }
            }
            .clipped()
            .onChange(of: scrollValue, perform: { value in
                if value >= progressHeight {
                    performReload()
                }
            })
        }

        private func performReload() {
            isLoading = true
            Task {
                await onReload()
                isLoading = false
            }
        }
    }
}
