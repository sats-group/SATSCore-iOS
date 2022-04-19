import UIKit

public extension UIColor {
    // MARK: Background

    static var backgroundPrimary: UIColor { color(.backgroundPrimary) }
    static var backgroundSecondary: UIColor { color(.backgroundSecondary) }
    static var backgroundSurfacePrimary: UIColor { color(.backgroundSurfacePrimary) }
    static var backgroundSurfaceSecondary: UIColor { color(.backgroundSurfaceSecondary) }

    // MARK: Secondary

    static var secondary: UIColor { color(.secondary) }
    static var secondaryHighlight: UIColor { color(.secondaryHighlight) }
    static var secondaryDisabled: UIColor { color(.secondaryDisabled) }

    // MARK: Clean

    static var clean: UIColor { color(.clean) }
    static var cleanHighlight: UIColor { color(.cleanHighlight) }
    static var cleanDisabled: UIColor { color(.cleanDisabled) }

    // MARK: Clean Secondary

    static var cleanSecondary: UIColor { color(.cleanSecondary) }
    static var cleanSecondaryHighlight: UIColor { color(.cleanSecondaryHighlight) }
    static var cleanSecondaryDisabled: UIColor { color(.cleanSecondaryDisabled) }

    // MARK: CTA

    static var cta: UIColor { color(.cta) }
    static var ctaHighlight: UIColor { color(.ctaHighlight) }
    static var ctaDisabled: UIColor { color(.ctaDisabled) }
    static var nonText: UIColor { color(.nonText) }

    // MARK: Waitlist

    static var waitlist: UIColor { color(.waitlist) }
    static var waitlistHighlight: UIColor { color(.waitlistHighlight) }

    // MARK: Signal

    static var signalSuccess: UIColor { color(.signalSuccess) }
    static var signalWarning: UIColor { color(.signalWarning) }
    static var signalDelete: UIColor { color(.signalDelete) }
    static var signalError: UIColor { color(.signalError) }

    // MARK: SignalText

    static var signalSuccessText: UIColor { color(.signalSuccessText) }
    static var signalWarningText: UIColor { color(.signalWarningText) }
    static var signalDeleteText: UIColor { color(.signalDeleteText) }
    static var signalErrorText: UIColor { color(.signalErrorText) }

    // MARK: UI

    static var border: UIColor { color(.border) }
    static var graphicalElements1: UIColor { color(.graphicalElements1) }
    static var graphicalElements2: UIColor { color(.graphicalElements2) }
    static var graphicalElements3: UIColor { color(.graphicalElements3) }
    static var shimmer: UIColor { color(.shimmer) }
    static var tabs: UIColor { color(.tabs) }

    // MARK: "On" colors

    // used in text and icons "on" top of another color

    static var onPrimary: UIColor { color(.onPrimary) }
    static var onPrimaryDisabled: UIColor { color(.onPrimaryDisabled) }

    static var onSecondary: UIColor { color(.onSecondary) }
    static var onSecondaryDisabled: UIColor { color(.onSecondaryDisabled) }

    static var onClean: UIColor { color(.onClean) }
    static var onCleanDisabled: UIColor { color(.onCleanDisabled) }

    static var onCleanSecondary: UIColor { color(.onCleanSecondary) }
    static var onCleanSecondaryDisabled: UIColor { color(.onCleanSecondaryDisabled) }

    static var onCta: UIColor { color(.onCta) }
    static var onCtaDisabled: UIColor { color(.onCtaDisabled) }

    static var onNonText: UIColor { color(.onNonText) }
    static var onSignal: UIColor { color(.onSignal) }
    static var onWaitlist: UIColor { color(.onWaitlist) }

    static var onBackgroundEnabledOn: UIColor { color(.onBackgroundEnabledOn) }
    static var onBackgroundEnabledOff: UIColor { color(.onBackgroundEnabledOff) }
    static var onBackgroundDisabledOn: UIColor { color(.onBackgroundDisabledOn) }
    static var onBackgroundDisabledOff: UIColor { color(.onBackgroundDisabledOff) }
    static var onBackgroundPrimary: UIColor { color(.onBackgroundPrimary) }
    static var onBackgroundSecondary: UIColor { color(.onBackgroundSecondary) }
    static var onBackgroundDisabled: UIColor { color(.onBackgroundDisabled) }

    static var onSurfaceEnabledOn: UIColor { color(.onSurfaceEnabledOn) }
    static var onSurfaceEnabledOff: UIColor { color(.onSurfaceEnabledOff) }
    static var onSurfaceDisabledOn: UIColor { color(.onSurfaceDisabledOn) }
    static var onSurfaceDisabledOff: UIColor { color(.onSurfaceDisabledOff) }
    static var onSurfacePrimary: UIColor { color(.onSurfacePrimary) }
    static var onSurfaceSecondary: UIColor { color(.onSurfaceSecondary) }
    static var onSurfaceDisabled: UIColor { color(.onSurfaceDisabled) }

    static var onGradientPrimary: UIColor { color(.onGradientPrimary) }
    static var onGradientSecondary: UIColor { color(.onGradientSecondary) }
    static var onGradientDisabled: UIColor { color(.onGradientDisabled) }

    // MARK: Theme dependant colors

    static var primary: UIColor { themedColor(.primary) }
    static var primaryHighlight: UIColor { themedColor(.primaryHighlight) }
    static var primaryDisabled: UIColor { themedColor(.primaryDisabled) }

    static var selection: UIColor { themedColor(.selection) }

    static var backgroundTopStart: UIColor { themedColor(.backgroundTopStart) }
    static var backgroundTopEnd: UIColor { themedColor(.backgroundTopEnd) }

    static var navigation: UIColor { themedColor(.navigation) }

    // MARK: Challenge colors

    static var challengeFailed: UIColor { color(.challengeFailed) }
    static var challengeInProgress: UIColor { color(.challengeInProgress) }
    static var challengeNotDone: UIColor { color(.challengeNotDone) }
    static var challengeSuccess: UIColor { color(.challengeSuccess) }

    // MARK: Private

    private static func themedColor(_ name: ColorName) -> UIColor {
        // we use colors with a dynamic provider to re-evaluate colors when the theme changes
        UIColor { _ in
            guard let uiColor = ColorTheme.current[name] else {
                preconditionFailure("❌ \(name.rawValue) should be present in theme \(ColorTheme.current.name)")
            }

            return uiColor
        }
    }

    private static func color(_ name: ColorName) -> UIColor {
        guard let color = UIColor(named: name.rawValue, in: .module, compatibleWith: nil) else {
            preconditionFailure("❌ \(name.rawValue) color not found!")
        }

        return color
    }
}
