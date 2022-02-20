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
}
