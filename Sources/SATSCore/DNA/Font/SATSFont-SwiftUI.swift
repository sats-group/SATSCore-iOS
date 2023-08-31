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

// MARK: - Font extension

public extension Font {
    /// This method uses `UIFontMetrics` to calculate the scaled size
    /// of the font with dyamic type.
    /// It's recommended to use `satsFont(_:scaledSize:weight:design)` instead
    static func satsFont(
        _ style: SATSFont.TextStyle,
        weight: SATSFont.Weight = .default,
        design: Font.Design = .default
    ) -> Font {
        let scaledFont = UIFontMetrics(forTextStyle: style.nativeStyle).scaledValue(for: style.size)
        return satsFont(style, scaledSize: scaledFont, weight: weight, design: design)
    }

    /// Determines the SATS font with the right size to use
    /// in case we use `.satsFeeling` as the `weight` value, we use a custom font
    /// otherwise the default `SF Font` will be used.
    ///
    /// the `design` parameter is only to be inteded to be used for weights that are not `.satsFeeling`
    static func satsFont(
        _ style: SATSFont.TextStyle,
        scaledSize: CGFloat,
        weight: SATSFont.Weight = .default,
        design: Font.Design = .default
    ) -> Font {
        if weight == .satsFeeling {
            return .custom(weight.font.name, size: style.size, relativeTo: .from(style.nativeStyle))
        } else {
            return .system(size: scaledSize, weight: .from(weight), design: design)
        }
    }
}

public extension Font.TextStyle {
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

public extension Font.Weight {
    static func from(_ weight: SATSFont.Weight) -> Self {
        switch weight {
        case .medium:
            return .medium
        case .emphasis:
            return .semibold
        default:
            return .regular
        }
    }
}
