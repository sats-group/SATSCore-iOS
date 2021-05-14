import UIKit
import SATSType

public struct SATSFont {
    public static func registerCustomFonts() {
        FontAccess.registerCustomFonts()
    }

    public static func font(style: TextStyle, weight: Weight) -> UIFont {
        FontAccess.font(textStyle: style.nativeStyle, size: style.size, variantName: weight.fontName)
    }
}
