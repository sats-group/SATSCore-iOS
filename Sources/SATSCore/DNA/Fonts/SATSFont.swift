import UIKit

public struct SATSFont {
    public static func registerCustomFonts() {
        InterFont
            .allCases
            .map(\.name)
            .forEach(registerFont(with:))
    }

    public static func font(style: TextStyle, variant: FontVariation) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: style.nativeStyle)

        let fontName = "Inter-\(variant.fontName)"
        guard let font = UIFont(name: fontName, size: style.size) else {
            assertionFailure("❌ \(fontName) should be available, you should call SATSFont.registerCustomFonts()")
            return UIFont.preferredFont(forTextStyle: style.nativeStyle)
        }

        return metrics.scaledFont(for: font)
    }

    /// Manual registration of a custom font from a file
    private static func registerFont(with fileName: String) {
        guard
            let fontPath = Bundle.module.path(forResource: fileName, ofType: "otf"),
            let fontData = NSData(contentsOfFile: fontPath),
            let dataProvider = CGDataProvider(data: fontData),
            let fontReference = CGFont(dataProvider)
        else {
            return
        }

        var errorRef: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(fontReference, &errorRef)
    }
}
