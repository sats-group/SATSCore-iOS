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

import SwiftUI

@available(iOS 17.0, *)
public extension Color.Resolved {
    var hexString: String {
        if opacity == 1.0 {
            String(format: "#%02lX%02lX%02lX", lroundf(red * 255), lroundf(green * 255), lroundf(blue * 255))
        } else {
            String(
                format: "#%02lX%02lX%02lX%02lX",
                lroundf(red * 255),
                lroundf(green * 255),
                lroundf(blue * 255),
                lroundf(opacity * 255)
            )
        }
    }

    var hexDescription: String {
        let hexColorCode = String(
            format: "#%02lX%02lX%02lX", lroundf(red * 255), lroundf(green * 255), lroundf(blue * 255)
        )
        let opacityIfNeeded = opacity == 1.0 ? "" : " \(opacity.formatted(.number.precision(.significantDigits(2))))"

        return hexColorCode + opacityIfNeeded
    }
}
