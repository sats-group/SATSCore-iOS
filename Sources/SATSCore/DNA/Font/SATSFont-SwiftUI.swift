import SwiftUI

public extension View {
    @ViewBuilder
    func satsFont(
        _ style: SATSFont.TextStyle,
        weight: SATSFont.Weight = .default,
        design: Font.Design = .default
    ) -> some View {
        modifier(FontContainerModifier(style: style, weight: weight, design: design))
    }
}

/// Internal implementation of a scaled system font
private struct FontContainerModifier: ViewModifier {
    let style: SATSFont.TextStyle
    let weight: SATSFont.Weight
    let design: Font.Design
    @ScaledMetric var fontSize: CGFloat

    init(style: SATSFont.TextStyle, weight: SATSFont.Weight, design: Font.Design) {
        self.style = style
        self.weight = weight
        self.design = design
        self._fontSize = ScaledMetric(wrappedValue: style.size, relativeTo: .from(style.nativeStyle))
    }

    func body(content: Content) -> some View {
        content
            .font(.satsFont(style, scaledSize: fontSize, weight: weight, design: design))
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
