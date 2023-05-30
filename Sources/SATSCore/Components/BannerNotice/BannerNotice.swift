import SwiftUI

public struct BannerNoticeViewData {
    let message: String
    let action: Action?

    public init(message: String, action: Action? = nil) {
        self.message = message
        self.action = action
    }
}

public extension BannerNoticeViewData {
    struct Action {
        let title: String
        let icon: Image?
        let onClick: (() -> Void)

        public init(title: String, icon: Image? = nil, onClick: @escaping () -> Void) {
            self.title = title
            self.icon = icon
            self.onClick = onClick
        }
    }
}

public struct BannerNotice: View {
    let viewData: BannerNoticeViewData

    public init(viewData: BannerNoticeViewData) {
        self.viewData = viewData
    }

    public var body: some View {
        HStack(spacing: 0) {
            Text(viewData.message)
                .satsFont(.basic)
                .foregroundColor(.onPrimary)
                .multilineTextAlignment(.leading)

            Spacer()

            button
        }
        .padding(.horizontal, .spacingM)
        .padding(.vertical, .spacingXS)
        .frame(maxWidth: .infinity, minHeight: 56)
        .background(Color.satsPrimary)
    }

    @ViewBuilder
    var button: some View {
        if let action = viewData.action {
            Button(action: action.onClick) {
                HStack(spacing: .spacingXXS) {
                    if let icon = action.icon {
                        icon
                            .resizable()
                            .frame(size: 24)
                    }
                    Text(action.title)
                }
            }
            .satsButton(.clean, size: .basic)
        }
    }
}
