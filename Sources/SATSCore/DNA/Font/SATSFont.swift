import UIKit
import SATSType
import SwiftUI

public struct SATSFont {
    public static func registerCustomFonts() {
        FontAccess.registerCustomFonts()
    }

    public static func font(style: TextStyle, weight: Weight) -> UIFont {
        FontAccess.font(textStyle: style.nativeStyle, size: style.size, variantName: weight.fontName)
    }

    public static func fontName(for weight: Weight) -> String {
        FontAccess.fontName(for: weight.fontName)
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
}
