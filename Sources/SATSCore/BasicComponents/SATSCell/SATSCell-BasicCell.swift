import SwiftUI

public extension SATSCell {
    /// A button to implement a custom table-view cell
    struct BasicCell<IconView: View, AccessoryView: View, ActionView: View>: View {
        @ViewBuilder var icon: IconView
        var title: String
        var subtitle: String?
        @ViewBuilder var accessory: AccessoryView
        @ViewBuilder var action: ActionView
        var includeDivider: Bool = true
        var onClick: (() -> Void)?
        let backgroundColor: Color

        public init(
            @ViewBuilder icon: () -> IconView = SATSCell.NoIcon.init,
            title: String,
            subtitle: String? = nil,
            @ViewBuilder accessory: () -> AccessoryView = EmptyView.init,
            @ViewBuilder action: () -> ActionView = SATSCell.SystemChevron.init,
            includeDivider: Bool = true,
            onClick: (() -> Void)? = nil,
            backgroundColor: Color = .surfacePrimary
        ) {
            self.icon = icon()
            self.title = title
            self.subtitle = subtitle
            self.accessory = accessory()
            self.action = action()
            self.includeDivider = includeDivider
            self.onClick = onClick
            self.backgroundColor = backgroundColor
        }

        public var body: some View {
            Button(action: { onClick?() }) {
                HStack(alignment: .center, spacing: .spacingS) {
                    icon
                        .padding(.leading, .spacingS)

                    VStack(spacing: 0) {
                        HStack(spacing: .spacingXS) {
                            VStack(alignment: .leading, spacing: .spacingXXS) {
                                Text(title)
                                    .satsFont(.basic)

                                subtitleLabel
                            }
                            Spacer()
                            accessory
                            action
                        }
                        .padding(.trailing, .spacingM)
                        .padding(.vertical, .spacingM)

                        divider
                    }
                }
                .contentShape(Rectangle())
                .background(backgroundColor)
            }
            .buttonStyle(.plain)
        }

        @ViewBuilder var subtitleLabel: some View {
            if let subtitle {
                Text(subtitle)
                    .satsFont(.small)
            }
        }

        @ViewBuilder var divider: some View {
            if includeDivider {
                Divider()
                    .background(Color.border)
            }
        }
    }
}
