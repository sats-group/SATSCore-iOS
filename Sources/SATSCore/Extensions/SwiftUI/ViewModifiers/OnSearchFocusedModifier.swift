import SwiftUI

public extension View {
    /// Perform the given action when the `isSearching` environment property
    /// changes from `false` to `true`.
    func onSearchFocused(perform action: (() -> Void)?) -> some View {
        modifier(OnSearchFocusedModifier(onSearchFocused: action))
    }
}

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
