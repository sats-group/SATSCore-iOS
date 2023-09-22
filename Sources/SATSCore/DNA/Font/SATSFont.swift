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
        case .title1: .title
        case .title2: .title2
        case .title3: .title3
        case .body: .body
        case .callout: .callout
        case .footnote: .footnote
        case .subheadline: .subheadline
        default:
            fatalError("❌ unhandled UIKit to SwiftUI text style conversion")
        }
    }

    private static func mapSatsFeelingSize(style: SATSFont.TextStyle) -> CGFloat {
        switch style {
        case .h1: 32
        case .h2: 26
        case .h3: 21
        default: style.size
        }
    }
}
