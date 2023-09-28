import SwiftUI

public extension SATSLabel.Style {
    static let primary: Self = .init(background: .satsPrimary, foreground: .onPrimary)
    static let secondary: Self = .init(background: .satsSecondary, foreground: .onSecondary)
    static let coral: Self = .init(background: .cta, foreground: .onCta)
}

public struct SATSLabel: View {
    let text: String
    let style: Style

    public init(_ text: String, style: Style) {
        self.text = text
        self.style = style
    }

    public var body: some View {
        Text(text)
            .foregroundStyle(style.foreground)
            .textCase(.uppercase)
            .satsFont(.small)
            .padding(.vertical, .spacingXXS)
            .padding(.horizontal, .spacingS)
            .background(style.background)
            .cornerRadius(4)
    }
}

public extension SATSLabel {
     struct Style {
        let background: Color
        let foreground: Color
    }
}

#Preview {
    VStack(spacing: .spacingM) {
        SATSLabel("Primary", style: .primary)
        SATSLabel("Secondary", style: .secondary)
        SATSLabel("Coral", style: .coral)
    }
}
