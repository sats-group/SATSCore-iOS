import UIKit

public extension UIColor {
    /// Get a Hex string from a given color
    ///
    /// inspired by https://cocoacasts.com/from-hex-to-uicolor-and-back-in-swift
    var hexString: String? {
        guard
            let components = cgColor.components,
            components.count >= 3
        else {
            return nil
        }

        let red = Float(components[0])
        let green = Float(components[1])
        let blue = Float(components[2])

        return String(format: "#%02lX%02lX%02lX", lroundf(red * 255), lroundf(green * 255), lroundf(blue * 255))
    }
}
