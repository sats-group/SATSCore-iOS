import UIKit
import SATSType
import SwiftUI

public struct SATSFont {
    public static func registerCustomFonts() {
        FontAccess.registerCustomFonts()
    }

    public static func font(style: TextStyle, weight: Weight) -> UIFont {
        FontAccess.font(
            font: weight.font,
            textStyle: style.nativeStyle,
            size: weight == .satsFeeling ? mapSatsFeelingSize(style: style) : style.size
        )
    }

    /// Converts the UIKit text style into SwiftUI text style
    public static func style(for textStyle: UIFont.TextStyle) -> Font.TextStyle {
        switch textStyle {
        case .title1: return .title
        case .title2: return .title2
        case .title3: return .title3
        case .body: return .body
        case .callout: return .callout
        case .footnote: return .footnote
        case .subheadline: return .subheadline
        default:
            fatalError("❌ unhandled UIKit to SwiftUI text style conversion")
        }
    }

    private static func mapSatsFeelingSize(style: SATSFont.TextStyle) -> CGFloat {
        switch style {
        case .h1: return 32
        case .h2: return 26
        case .h3: return 21
        default: return style.size
        }
    }
}
