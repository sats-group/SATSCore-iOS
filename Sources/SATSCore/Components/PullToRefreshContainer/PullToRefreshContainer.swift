import SwiftUI

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
@available(iOS 14.0, *)
@available(iOS,
    deprecated: 15,
    message: "This was a backport of the modifier for pull to refresh, now you should use the modifiers on list"
)
public struct PullToRefreshContainer<Content: View>: View {
    @State var scrollValue: CGFloat = 0
    let isLoading: Bool
    let onReload: () -> Void
    var content: Content

    public init(
        isLoading: Bool,
        onReload: @escaping () -> Void,
        @ViewBuilder content: () -> Content
    ) {
        self.isLoading = isLoading
        self.onReload = onReload
        self.content = content()
    }

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
                onReload()
            }
        })
    }
}
