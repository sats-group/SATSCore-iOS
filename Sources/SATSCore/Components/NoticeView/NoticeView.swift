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
        }
        .foregroundColor(notice.foregroundColor)
        .padding(16)
        .background(notice.backgroundColor)
        .cornerRadius(8)
        .padding(8)
        .onTapGesture(perform: performTap)
        .frame(maxWidth: .readableWidthM)
    }

    func performTap() {
        onTap?()
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
