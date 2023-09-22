import SwiftUI

public extension View {
    @ViewBuilder
    func satsFont(_ style: SATSFont.TextStyle, weight: SATSFont.Weight = .default) -> some View {
        font(.satsFont(style, weight: weight))
    }
}

public extension Text {
    func satsFont(_ style: SATSFont.TextStyle, weight: SATSFont.Weight = .default) -> Text {
        font(.satsFont(style, weight: weight))
    }
}

public extension Font {
    static func satsFont(_ style: SATSFont.TextStyle, weight: SATSFont.Weight = .default) -> Font {
        Font.custom(weight.font.name, size: style.size, relativeTo: .from(style.nativeStyle))
    }
}

extension Font.TextStyle {
    /// Convert an UIKit text style into a SwiftUI one
    static func from(_ uiFontStyle: UIFont.TextStyle) -> Self {
        switch uiFontStyle {
        case .title1: .title
        case .title2: .title2
        case .title3: .title3
        case .callout: .callout
        case .footnote: .footnote
        case .subheadline: .subheadline
        default:
            .body
        }
    }
}
