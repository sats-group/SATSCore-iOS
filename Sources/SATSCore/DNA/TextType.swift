import UIKit

public enum TextType {
    case h1, h2, h3
    case h1Medium, h2Medium, h3Medium
    case h1Emphasis, h2Emphasis, h3Emphasis
    case h1SatsFeeling, h2SatsFeeling, h3SatsFeeling
    case large, basic, small
    case largeMedium, basicMedium, smallMedium
    case largeEmphasis, basicEmphasis, smallEmphasis
    case largeSatsFeeling, basicSatsFeeling, smallSatsFeeling
    case section
    case button
    case navigationTitle
    case extraSmall

    static let styles: [TextType: TextStyle] = [
        .h1: .init(fontSize: 28, lineHeightMultiple: 1.09),
        .h2: .init(fontSize: 24, lineHeightMultiple: 1.25),
        .h3: .init(fontSize: 20, lineHeightMultiple: 1.25),
        .h1Medium: .init(fontSize: 28, fontWeight: .medium, lineHeightMultiple: 1.09),
        .h2Medium: .init(fontSize: 24, fontWeight: .medium, lineHeightMultiple: 1.25),
        .h3Medium: .init(fontSize: 19, fontWeight: .medium, lineHeightMultiple: 1.25),
        .h1Emphasis: .init(fontSize: 28, fontWeight: .semibold, lineHeightMultiple: 1.09),
        .h2Emphasis: .init(fontSize: 24, fontWeight: .semibold, lineHeightMultiple: 1.25),
        .h3Emphasis: .init(fontSize: 19, fontWeight: .semibold, lineHeightMultiple: 1.25),
        .h1SatsFeeling: .init(
            fontSize: 28,
            fontWeight: .bold,
            isItalic: true,
            forceUppercase: true,
            lineHeightMultiple: 1.09
        ),
        .h2SatsFeeling: .init(
            fontSize: 24,
            fontWeight: .semibold,
            isItalic: true,
            forceUppercase: true,
            lineHeightMultiple: 1.25
        ),
        .h3SatsFeeling: .init(
            fontSize: 19,
            fontWeight: .semibold,
            isItalic: true,
            forceUppercase: true,
            lineHeightMultiple: 1.25
        ),
        .large: .init(fontSize: 16, lineHeightMultiple: 1.07),
        .basic: .init(fontSize: 14, lineHeightMultiple: 1.07),
        .small: .init(fontSize: 12, lineHeightMultiple: 1.07),
        .largeMedium: .init(fontSize: 16, fontWeight: .medium, lineHeightMultiple: 1.07),
        .basicMedium: .init(fontSize: 14, fontWeight: .medium, lineHeightMultiple: 1.07),
        .smallMedium: .init(fontSize: 12, fontWeight: .medium, lineHeightMultiple: 1.07),
        .largeEmphasis: .init(fontSize: 16, fontWeight: .semibold, lineHeightMultiple: 1.07),
        .basicEmphasis: .init(fontSize: 14, fontWeight: .semibold, lineHeightMultiple: 1.07),
        .smallEmphasis: .init(fontSize: 12, fontWeight: .semibold, lineHeightMultiple: 1.07),
        .largeSatsFeeling: .init(
            fontSize: 16,
            fontWeight: .semibold,
            isItalic: true,
            forceUppercase: true,
            lineHeightMultiple: 1.07
        ),
        .basicSatsFeeling: .init(
            fontSize: 14,
            fontWeight: .semibold,
            isItalic: true,
            forceUppercase: true,
            lineHeightMultiple: 1.07
        ),
        .smallSatsFeeling: .init(
            fontSize: 12,
            fontWeight: .semibold,
            isItalic: true,
            forceUppercase: true,
            lineHeightMultiple: 1.07
        ),
        .section: .init(fontSize: 16, fontWeight: .semibold),
        .button: .init(fontSize: 14, fontWeight: .semibold),
        .navigationTitle: .init(fontSize: 16, fontWeight: .semibold),
        .extraSmall: .init(fontSize: 0),
    ]

    var style: TextStyle { Self.styles[self] ?? TextStyle() }
}

public enum TextColorType {
    case primary
    case secondary
    case custom(UIColor)
}

struct TextStyle {
    var fontSize: CGFloat = 14
    var fontWeight: UIFont.Weight = .regular
    var isItalic: Bool = false
    var isUnderlined: Bool = false
    var isMonospacedDigit: Bool = false
    var forceUppercase: Bool = false
    var colorType: TextColorType = .primary
    var lineHeight: CGFloat?
    var lineHeightMultiple: CGFloat?

    var font: UIFont {
        var font = TextHelper.getFont(size: fontSize, weight: fontWeight, isItalic: isItalic)
            ?? .systemFont(ofSize: fontSize, weight: fontWeight)
        if isMonospacedDigit { font = font.monospacedDigitFont }
        return font
    }

    var color: UIColor {
        switch colorType {
        case .primary:
            return ColorTheme.TypoPositive.primary.color
        case .secondary:
            return ColorTheme.TypoPositive.secondary.color
        case .custom(let color):
            return color
        }
    }
}

class TextHelper {
    static let defaultTextColor = ColorTheme.TypoPositive.primary.color
    static let bullet =  "•"

    static func getFont(size: CGFloat, weight: UIFont.Weight, isItalic: Bool = false) -> UIFont? {
        var fontName = "Inter-"

        if weight == .regular {
            fontName += isItalic ? "Italic" : "Regular"
        } else {
            if weight == .medium { fontName += "Medium" }
            if weight == .semibold { fontName += "SemiBold" }
            if weight == .bold { fontName += "Bold" }
            if isItalic { fontName += "Italic" }
        }

        return UIFont(name: fontName, size: size)
    }
}
