import SwiftUI

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
            retryButton
        }
        .foregroundColor(notice.foregroundColor)
        .padding(16)
        .background(notice.backgroundColor)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.08), radius: 1, x: 0, y: 1)
        .shadow(color: Color.black.opacity(0.12), radius: 5, x: 0, y: 1)
        .shadow(color: Color.black.opacity(0.1), radius: 9, x: 0, y: 2)
        .padding(8)
        .onTapGesture(perform: performTap)
        .frame(maxWidth: .readableWidthM)
    }

    func performTap() {
        onTap?()
    }

    @ViewBuilder var retryButton: some View {
        if let onRetry = notice.onRetry, let retryTitle = notice.retryTitle {
            HStack {
                Divider()
                    .frame(height: 16)

                Button(action: onRetry) {
                    Text(retryTitle.uppercased())
                        .satsFont(.basic, weight: .emphasis)
                        .foregroundColor(.onSurfacePrimary)
                }
                .padding(.horizontal, 8)
            }
        }
    }

    @ViewBuilder var icon: some View {
        if let icon = notice.icon {
            icon.renderingMode(.original)
        }
    }

    var message: some View {
        VStack(alignment: .leading, spacing: 1) {
            Text(notice.title)
                .satsFont(.basic, weight: .emphasis)

            if let explanation = notice.explanation {
                Text(explanation)
                    .satsFont(.basic)
            }
        }
    }
}
