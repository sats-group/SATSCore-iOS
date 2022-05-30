import SwiftUI

@available(iOS 15.0, *)
public extension View {
    /// Perform the given action when the `isSearching` environment property
    /// changes from `false` to `true`.
    func onSearchFocused(perform action: (() -> Void)?) -> some View {
        self.modifier(OnSearchFocusedModifier(onSearchFocused: action))
    }
}

@available(iOS 15.0, *)
private struct OnSearchFocusedModifier: ViewModifier {
    var onSearchFocused: () -> Void
    @Environment(\.isSearching) var isSearching

    init(onSearchFocused: (() -> Void)? = nil) {
        self.onSearchFocused = onSearchFocused ?? {}
    }

    func body(content: Content) -> some View {
        content
            .onChange(of: isSearching) { isSearching in
                guard isSearching else { return }
                onSearchFocused()
            }
    }
}
