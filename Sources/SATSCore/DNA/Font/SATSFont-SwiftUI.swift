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
        case .title1: return .title
        case .title2: return .title2
        case .title3: return .title3
        case .callout: return .callout
        case .footnote: return .footnote
        case .subheadline: return .subheadline
        default:
            return .body
        }
    }
}
