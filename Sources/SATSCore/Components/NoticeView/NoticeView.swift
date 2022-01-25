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
        .padding(8)
        .onTapGesture(perform: performTap)
        .shadow(radius: 2)
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
                }
                .padding(.horizontal, 8)
            }
        }
    }

    @ViewBuilder var icon: some View {
        if let icon = notice.icon {
            icon
        }
    }

    var message: some View {
        VStack(alignment: .leading, spacing: 1) {
            Text(notice.title)
                .satsFont(.basic, weight: .emphasis)

            if let explanation = notice.explanation {
                Text(explanation)
                    .satsFont(.small)
            }
        }
    }
}
