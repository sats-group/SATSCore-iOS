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
@available(iOS,
    deprecated: 15,
    message: "This was a backport of the modifier for pull to refresh, now you should use the modifiers on list"
)
public struct PullToRefreshContainer<Content: View>: View {
    @State private var scrollValue: CGFloat = 0

    /// This property is to keep track if the `onReload`
    /// method has been called or not.
    /// Since we cannot know that the `onReaload` will
    /// actually be an async function, then we cannot
    /// await for that function to return to set this property to `false`
    ///
    /// Then this property acts to track the "gesture" of
    /// the pull to refresh action, not if the async `onReload`
    /// method returned.
    @State private var isLoading: Bool = false

    var onReload: () async -> Void
    @ViewBuilder var content: Content

    public init(onReload: @escaping () async -> Void, @ViewBuilder content: () -> Content) {
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
        .onChange(of: scrollValue, perform: reloadIfNeeded(given:))
    }

    /// Only call `performReload` if needed
    /// The main conditions that we need is:
    /// - the user scrolls "enough" to start the reload of data
    /// - there is no a reload in progress
    private func reloadIfNeeded(given value: CGFloat) {
        guard
            !isLoading,
            value >= progressHeight
        else {
            // Since we are not awaiting to `performReload`
            // to reset this value, we can derive if we
            // need to reset `isLoading = false` with this condition
            isLoading = !(value < progressHeight)
            return
        }

        performReload()
    }

    private func performReload() {
        isLoading = true
        Task { await onReload() }
    }
}
