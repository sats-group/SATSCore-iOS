import SwiftUI

@available(iOS 13.0, *)
public extension Color {

    // MARK: Background

    static var backgroundPrimary: Color { color(named: "backgroundPrimary") }
    static var backgroundSecondary: Color { color(named: "backgroundSecondary") }
    static var backgroundShimmer: Color { color(named: "backgroundShimmer") }
    static var backgroundTabbar: Color { color(named: "backgroundTabbar") }
    static var backgroundSurfaceStart: Color { color(named: "backgroundSurfaceStart") }
    static var backgroundSurfaceEnd: Color { color(named: "backgroundSurfaceEnd") }

    // MARK: Button

    static var buttonPrimary: Color { color(named: "buttonPrimary") }
    static var buttonPrimaryHighlight: Color { color(named: "buttonPrimaryHighlight") }
    static var buttonPrimaryDisabled: Color { color(named: "buttonPrimaryDisabled") }

    static var buttonSecondary: Color { color(named: "buttonSecondary") }
    static var buttonSecondaryHighlight: Color { color(named: "buttonSecondaryHighlight") }
    static var buttonSecondaryDisabled: Color { color(named: "buttonSecondaryDisabled") }

    static var buttonCta: Color { color(named: "buttonCta") }
    static var buttonCtaHighlight: Color { color(named: "buttonCtaHighlight") }
    static var buttonCtaDisabled: Color { color(named: "buttonCtaDisabled") }

    // MARK: "On" colors
    // "On" colors are used for text and icons, they are related on where this text/icon
    // is presented "on top of", like a backgroundPrimary, etc.

    static var onButtonPrimary: Color { color(named: "onButtonPrimary")}
    static var onButtonPrimarySecondary: Color { color(named: "onButtonPrimarySecondary")}

    static var onButtonSecondary: Color { color(named: "onButtonSecondary")}
    static var onButtonSecondarySecondary: Color { color(named: "onButtonSecondarySecondary")}

    static var onButtonCta: Color { color(named: "onButtonCta")}
    static var onButtonCtaSecondary: Color { color(named: "onButtonCtaSecondary")}

    static var onBackgroundSurface: Color { color(named: "onBackgroundSurface")}
    static var onBackgroundSurfaceSecondary: Color { color(named: "onBackgroundSurfaceSecondary")}

    static var onBackgroundPrimary: Color { color(named: "onBackgroundPrimary")}
    static var onBackgroundPrimarySecondary: Color { color(named: "onBackgroundPrimarySecondary")}

    // MARK: Waitlist

    static var waitlist: Color { color(named: "waitlist") }

    // MARK: Link

    static var link: Color { color(named: "link") }

    // MARK: Signal

    static var signalSuccess: Color { color(named: "signalSuccess") }
    static var signalWarning: Color { color(named: "signalWarning") }
    static var signalDelete: Color { color(named: "signalDelete") }
    static var signalError: Color { color(named: "signalError") }

    // MARK: Other UI

    static var border: Color { color(named: "border") }

    // MARK: Private

    private static func color(named: String) -> Color {
        Color(named, bundle: .module)
    }
}

