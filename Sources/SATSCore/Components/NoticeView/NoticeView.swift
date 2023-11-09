import SwiftUI

#if os(iOS)
public struct NoticeView: View {
    let notice: Notice
    let onTap: (() -> Void)?

    public init(notice: Notice, onTap: (() -> Void)? = nil) {
        self.notice = notice
        self.onTap = onTap
    }

    public var body: some View {
        HStack(spacing: 10) {
            icon
            message
            Spacer()
            actionButton
        }
        .padding(16)
        .background(Color.surfacePrimary)
        .cornerRadius(8)
        .padding(8)
        .onTapGesture(perform: performTap)
        .frame(maxWidth: .readableWidthM)
        .shadow(radius: .cornerRadiusS)
    }

    func performTap() {
        onTap?()
    }

    @ViewBuilder var actionButton: some View {
        if let onAction = notice.action, let actionTitle = notice.actionTitle {
            HStack {
                Divider()
                    .frame(height: 16)

                Button(action: onAction) {
                    Text(actionTitle.uppercased())
                        .satsFont(.basic, weight: .emphasis)
                        .foregroundColor(.onSurfacePrimary)
                }
                .padding(.horizontal, 8)
            }
        }
    }

    @ViewBuilder var icon: some View {
        if let icon = notice.icon {
            icon
                .font(.system(size: .spacingL, weight: .medium))
                .foregroundColor(notice.tintColor)
        }
    }

    var message: some View {
        VStack(alignment: .leading, spacing: .spacingXXXS) {
            if let title = notice.title {
                Text(title)
                    .satsFont(.basic, weight: .emphasis)
            }

            Text(notice.message)
                .satsFont(.basic, weight: .medium)
        }
        .foregroundColor(.onSurfaceSecondary)
    }
}
#endif
