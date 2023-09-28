import SwiftUI

public extension Tag.Style {
    static let primary: Self = .init(background: .satsPrimary, foreground: .onPrimary)
    static let secondary: Self = .init(background: .satsSecondary, foreground: .onSecondary)
    static let coral: Self = .init(background: .cta, foreground: .onCta)
}

public struct Tag: View {
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

public extension Tag {
    struct Style {
        let background: Color
        let foreground: Color
    }
}

#Preview {
    VStack(spacing: .spacingM) {
        Tag("Primary", style: .primary)
        Tag("Secondary", style: .secondary)
        Tag("Coral", style: .coral)
    }
}
