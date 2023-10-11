import SwiftUI

public struct SectionHeader<ActionView: View>: View {
    let title: String

    @ViewBuilder var actionView: ActionView
    var onClick: (() -> Void)?

    public init(
        title: String,
        @ViewBuilder actionView: () -> ActionView = EmptyView.init,
        onClick: (() -> Void)? = nil
    ) {
        self.title = title
        self.actionView = actionView()
        self.onClick = onClick
    }

    public var body: some View {
        wrapInButtonIfNeeded {
            HStack {
                Text(title)
                    .satsFont(.large, weight: .medium)
                    .foregroundStyle(Color.onBackgroundPrimary)

                Spacer()

                actionView
            }
        }
        .frame(minHeight: 25)
    }

    @ViewBuilder
    private func wrapInButtonIfNeeded<Content: View>(
        content: () -> Content
    ) -> some View {
        if let onClick {
            Button(action: onClick, label: content)
        } else {
            content()
        }
    }
}

struct SectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: .spacingM) {
            SectionHeader(title: "Title")
            SectionHeader(title: "Title", actionView: SystemChevron.init)
        }
    }
}
