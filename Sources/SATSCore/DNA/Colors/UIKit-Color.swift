import UIKit

public extension UIColor {

    // MARK: Background

    static var backgroundPrimary: UIColor { color(.backgroundPrimary) }
    static var backgroundSecondary: UIColor { color(.backgroundSecondary) }
    static var backgroundShimmer: UIColor { color(.backgroundShimmer) }
    static var backgroundTabbar: UIColor { color(.backgroundTabbar) }
    static var backgroundSurfaceStart: UIColor { color(.backgroundSurfaceStart) }
    static var backgroundSurfaceEnd: UIColor { color(.backgroundSurfaceEnd) }

    // MARK: Button

    static var buttonSecondary: UIColor { color(.buttonSecondary) }
    static var buttonSecondaryHighlight: UIColor { color(.buttonSecondaryHighlight) }
    static var buttonSecondaryDisabled: UIColor { color(.buttonSecondaryDisabled) }

    static var buttonCta: UIColor { color(.buttonCta) }
    static var buttonCtaHighlight: UIColor { color(.buttonCtaHighlight) }
    static var buttonCtaDisabled: UIColor { color(.buttonCtaDisabled) }

    // MARK: "On" colors
    // "On" colors are used for text and icons, they are related on where this text/icon
    // is presented "on top of", like a backgroundPrimary, etc.

    static var onButtonPrimary: UIColor { color(.onButtonPrimary) }
    static var onButtonPrimarySecondary: UIColor { color(.onButtonPrimarySecondary) }

    static var onButtonSecondary: UIColor { color(.onButtonSecondary) }
    static var onButtonSecondarySecondary: UIColor { color(.onButtonSecondarySecondary) }

    static var onButtonCta: UIColor { color(.onButtonCta) }
    static var onButtonCtaSecondary: UIColor { color(.onButtonCtaSecondary) }

    static var onBackgroundSurface: UIColor { color(.onBackgroundSurface)}
    static var onBackgroundSurfaceSecondary: UIColor { color(.onBackgroundSurfaceSecondary) }

    static var onBackgroundPrimary: UIColor { color(.onBackgroundPrimary)}
    static var onBackgroundPrimarySecondary: UIColor { color(.onBackgroundPrimarySecondary) }

    // MARK: Waitlist

    static var waitlist: UIColor { color(.waitlist) }
    static var waitlistHighlight: UIColor { color(.waitlistHighlight) }

    // MARK: Link

    static var link: UIColor { color(.link) }
    static var linkHighlight: UIColor { color(.linkHighlight) }

    // MARK: Signal

    static var signalSuccess: UIColor { color(.signalSuccess) }
    static var signalWarning: UIColor { color(.signalWarning) }
    static var signalDelete: UIColor { color(.signalDelete) }
    static var signalError: UIColor { color(.signalError) }

    // MARK: Other UI

    static var border: UIColor { color(.border) }

    // MARK: Theme dependant colors

    static var backgroundTopStart: UIColor { ColorTheme.current.backgroundTopStart }
    static var backgroundTopEnd: UIColor { ColorTheme.current.backgroundTopEnd }

    static var buttonPrimary: UIColor { ColorTheme.current.buttonPrimary }
    static var buttonPrimaryHighlight: UIColor { ColorTheme.current.buttonPrimaryHighlight }
    static var buttonPrimaryDisabled: UIColor { ColorTheme.current.buttonPrimaryDisabled }

    static var selection: UIColor { ColorTheme.current.selection }

    // MARK: Private

    private static func color(_ name: ColorName) -> UIColor {
        guard let color = UIColor(named: name.rawValue, in: .module, compatibleWith: nil) else {
            preconditionFailure("❌ \(name.rawValue) color not found!")
        }

        return color
    }
}
