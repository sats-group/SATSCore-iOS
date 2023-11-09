import SwiftUI

public struct TagViewData {
    let text: String
    let style: Style

    public init(text: String, style: Style) {
        self.text = text
        self.style = style
    }
}

public extension TagViewData {
    struct Style {
        let background: Color
        let foreground: Color
    }
}

public extension TagViewData.Style {
    static let primary: Self = .init(background: .tagPrimary, foreground: .onTagPrimary)
    static let secondary: Self = .init(background: .tagSecondary, foreground: .onTagSecondary)
    static let coral: Self = .init(background: .tagFeatured, foreground: .onTagFeatured)
}

public struct Tag: View {
    let viewData: TagViewData

    public init(_ text: String, style: TagViewData.Style) {
        self.viewData = .init(text: text, style: style)
    }

    public init(viewData: TagViewData) {
        self.viewData = viewData
    }

    public var body: some View {
        Text(viewData.text)
            .foregroundStyle(viewData.style.foreground)
            .textCase(.uppercase)
            .satsFont(.small)
            .padding(.vertical, .spacingXXS)
            .padding(.horizontal, .spacingS)
            .background(viewData.style.background)
            .cornerRadius(4)
    }
}

struct Tag_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: .spacingM) {
            Tag("Primary", style: .primary)
            Tag("Secondary", style: .secondary)
            Tag("Coral", style: .coral)
        }
    }
}
