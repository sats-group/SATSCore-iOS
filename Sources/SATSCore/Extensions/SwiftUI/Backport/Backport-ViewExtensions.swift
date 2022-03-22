import SwiftUI

public extension View {
    var backport: Backport<Self> { Backport(self) }
}

public extension Backport where Content: View {
    @available(iOS, deprecated: 15, message: "This is a backported version that is not neeeded anymore")
    @ViewBuilder func searchable(
        text: Binding<String>,
        prompt: Text? = nil
    ) -> some View {
        if #available(iOS 15, *) {
            content.searchable(text: text, placement: .navigationBarDrawer(displayMode: .always), prompt: prompt)
        } else {
            content
        }
    }

    @available(iOS, deprecated: 15, message: "This is a backported version that is not neeeded anymore")
    @ViewBuilder func tint(_ color: Color?) -> some View {
        if #available(iOS 15, *) {
            content.tint(color)
        } else {
            // deprecated version
            content.accentColor(color)
        }
    }

    @available(iOS, deprecated: 15, message: "This is a backported version that is not neeeded anymore")
    @ViewBuilder func task(_ action: @escaping () async -> Void) -> some View {
        if #available(iOS 15, *) {
            content.task {
                await action()
            }
        } else {
            content.modifier(Backported.TaskModifier(action: action))
        }
    }

    @available(iOS, deprecated: 15, message: "This is a backported version that is not neeeded anymore")
    @ViewBuilder func refreshable(_ action: @escaping () async -> Void) -> some View {
        if #available(iOS 15, *) {
            content.refreshable {
                await action()
            }
        } else {
            PullToRefreshContainer(onReload: action) {
                content
            }
        }
    }

    enum Visibility {
        case automatic
        case visible
        case hidden

        @available(iOS 15, *)
        var value: SwiftUI.Visibility {
            switch self {
            case .automatic:
                return .automatic

            case .visible:
                return .visible

            case .hidden:
                return .hidden
            }
        }
    }

    @available(iOS, deprecated: 15, message: "This is a backported version that is not neeeded anymore")
    @ViewBuilder func listRowSeparator(_ visibility: Visibility) -> some View {
        if #available(iOS 15, *) {
            content.listRowSeparator(visibility.value)
        } else {
            content
        }
    }
}
