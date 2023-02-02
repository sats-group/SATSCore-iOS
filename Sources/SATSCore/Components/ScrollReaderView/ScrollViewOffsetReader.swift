import SwiftUI

/**
 A view that helps to "bubble up" the scroll position for a SwiftUI content.

  `scrollValue` will be updated with the content offset when scrolling,
 then we use that binding to communicate up the scroll value so the
  container view can do state changed based on it.

  Original solution found in: https://developer.apple.com/forums/thread/650312
  */
public struct ScrollViewOffsetReader<Content: View>: View {
    let axis: Axis.Set
    let content: Content
    let showsIndicators: Bool
    @Binding var scrollValue: CGFloat

    private let namespace: String = "scrollReader"

    public init(
        _ axis: Axis.Set = .vertical,
        scrollValue: Binding<CGFloat>,
        showsIndicators: Bool = true,
        @ViewBuilder _ content: () -> Content
    ) {
        self.axis = axis
        self._scrollValue = scrollValue
        self.showsIndicators = showsIndicators
        self.content = content()
    }

    public var body: some View {
        ScrollView(axis, showsIndicators: showsIndicators) {
            ZStack {
                content

                GeometryReader { proxy in
                    Color.clear
                        .preference(
                            key: ScrollViewOffsetPreferenceKey.self,
                            value: offset(in: proxy)
                        )
                }
            }
        }
        .coordinateSpace(name: namespace)
        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
            scrollValue = value
        }
    }

    private func offset(in proxy: GeometryProxy) -> CGFloat {
        let frame = proxy.frame(in: .named(namespace))

        if axis == .horizontal {
            return frame.minX
        } else {
            return frame.minY
        }
    }
}

private struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
