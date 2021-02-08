import SwiftUI

@available(iOS 13.0, *)
public extension Color {

    // MARK: Background

    static var backgroundPrimary: Color { color(.backgroundPrimary) }
    static var backgroundSecondary: Color { color(.backgroundSecondary) }
    static var backgroundShimmer: Color { color(.backgroundShimmer) }
    static var backgroundTabbar: Color { color(.backgroundTabbar) }
    static var backgroundSurfaceStart: Color { color(.backgroundSurfaceStart) }
    static var backgroundSurfaceEnd: Color { color(.backgroundSurfaceEnd) }

    // MARK: Button

    static var buttonPrimary: Color { color(.buttonPrimary) }
    static var buttonPrimaryHighlight: Color { color(.buttonPrimaryHighlight) }
    static var buttonPrimaryDisabled: Color { color(.buttonPrimaryDisabled) }

    static var buttonSecondary: Color { color(.buttonSecondary) }
    static var buttonSecondaryHighlight: Color { color(.buttonSecondaryHighlight) }
    static var buttonSecondaryDisabled: Color { color(.buttonSecondaryDisabled) }

    static var buttonCta: Color { color(.buttonCta) }
    static var buttonCtaHighlight: Color { color(.buttonCtaHighlight) }
    static var buttonCtaDisabled: Color { color(.buttonCtaDisabled) }

    // MARK: "On" colors
    // "On" colors are used for text and icons, they are related on where this text/icon
    // is presented "on top of", like a backgroundPrimary, etc.

    static var onButtonPrimary: Color { color(.onButtonPrimary) }
    static var onButtonPrimarySecondary: Color { color(.onButtonPrimarySecondary) }

    static var onButtonSecondary: Color { color(.onButtonSecondary) }
    static var onButtonSecondarySecondary: Color { color(.onButtonSecondarySecondary) }

    static var onButtonCta: Color { color(.onButtonCta) }
    static var onButtonCtaSecondary: Color { color(.onButtonCtaSecondary) }

    static var onBackgroundSurface: Color { color(.onBackgroundSurface)}
    static var onBackgroundSurfaceSecondary: Color { color(.onBackgroundSurfaceSecondary) }

    static var onBackgroundPrimary: Color { color(.onBackgroundPrimary)}
    static var onBackgroundPrimarySecondary: Color { color(.onBackgroundPrimarySecondary) }

    // MARK: Waitlist

    static var waitlist: Color { color(.waitlist) }

    // MARK: Link

    static var link: Color { color(.link) }

    // MARK: Signal

    static var signalSuccess: Color { color(.signalSuccess) }
    static var signalWarning: Color { color(.signalWarning) }
    static var signalDelete: Color { color(.signalDelete) }
    static var signalError: Color { color(.signalError) }

    // MARK: Other UI

    static var border: Color { color(.border) }

    // MARK: Private

    private static func color(_ name: ColorName) -> Color {
        Color(name.rawValue, bundle: .module)
    }
}

