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
        Button(action: { onClick?() }) {
            HStack {
                Text(title)
                    .satsFont(.basic)
                    .foregroundStyle(Color.onBackgroundPrimary)

                Spacer()

                actionView
            }

        }
        .frame(minHeight: 25)
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
