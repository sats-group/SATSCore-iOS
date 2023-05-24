import SwiftUI

public struct ModernErrorView: View {
    let viewData: ErrorViewData
    var onRetry: (() async -> Void)?

    public init(viewData: ErrorViewData, onRetry: (() async -> Void)? = nil) {
        self.viewData = viewData
        self.onRetry = onRetry
    }

    public var body: some View {
        VStack(spacing: .spacingL) {
            Spacer()

            icon

            VStack(spacing: .spacingXS) {
                errorTitle
                errorMessage
            }

            Spacer()
        }
        .padding(.spacingXL)
        .lineLimit(nil)
        .foregroundColor(.onBackgroundPrimary)
        .overlay { retryButtonContainer }
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
        .background(Color.backgroundPrimary)
    }

    var icon: some View {
        Image(systemName: "xmark.circle")
            .font(.system(size: 48))
            .foregroundColor(.signalError)
    }

    @ViewBuilder var errorTitle: some View {
        if let title = viewData.title {
            Text(title)
                .satsFont(.section, weight: .emphasis)
        }
    }

    var errorMessage: some View {
        Text(viewData.message)
            .satsFont(.basic)
    }

    @ViewBuilder var retryButtonContainer: some View {
        if viewData.canRetry {
            VStack {
                Spacer()

                Button("Retry", action: retry)
                    .satsButton(errorStyle, size: .large)
                    .padding(.spacingL)
            }
        }
    }

    private func retry() {
        Task { @MainActor in
            await onRetry?()
        }
    }

    private let errorStyle: SATSButton.Style = .init(
        name: "ModernError",
        titleColor: .onSignal,
        titleColorDisabled: .onPrimaryDisabled,
        backgroundColor: .signalError,
        backgroundColorHighlighted: UIColor.signalError.withAlphaComponent(0.8),
        backgroundColorDisabled: .primaryDisabled
    )
}

struct ModernErrorView_Previews: PreviewProvider {
    static var previews: some View {
        SATSFont.registerCustomFonts()
        return Group {
            ModernErrorView(viewData: .previewValue())
                .previewDisplayName("Full data")

            ModernErrorView(viewData: .previewValue(title: nil))
                .previewDisplayName("Only Message")

            ModernErrorView(viewData: .previewValue(canRetry: false))
                .previewDisplayName("No button")
        }
    }
}
