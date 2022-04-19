import SwiftUI

public extension Color {
    // MARK: Background

    static var backgroundPrimary: Color { color(.backgroundPrimary) }
    static var backgroundSecondary: Color { color(.backgroundSecondary) }
    static var backgroundSurfacePrimary: Color { color(.backgroundSurfacePrimary) }
    static var backgroundSurfaceSecondary: Color { color(.backgroundSurfaceSecondary) }

    // MARK: Secondary

    // these colors are prefixed with "sats" as Color.secondary already exists
    // in SwiftUI
    static var satsSecondary: Color { color(.secondary) }
    static var satsSecondaryHighlight: Color { color(.secondaryHighlight) }
    static var satsSecondaryDisabled: Color { color(.secondaryDisabled) }

    // MARK: Clean

    static var clean: Color { color(.clean) }
    static var cleanHighlight: Color { color(.cleanHighlight) }
    static var cleanDisabled: Color { color(.cleanDisabled) }

    // MARK: Clean Secondary

    static var cleanSecondary: Color { color(.cleanSecondary) }
    static var cleanSecondaryHighlight: Color { color(.cleanSecondaryHighlight) }
    static var cleanSecondaryDisabled: Color { color(.cleanSecondaryDisabled) }

    // MARK: CTA

    static var cta: Color { color(.cta) }
    static var ctaHighlight: Color { color(.ctaHighlight) }
    static var ctaDisabled: Color { color(.ctaDisabled) }
    static var nonText: Color { color(.nonText) }

    // MARK: Waitlist

    static var waitlist: Color { color(.waitlist) }
    static var waitlistHighlight: Color { color(.waitlistHighlight) }

    // MARK: Signal

    static var signalSuccess: Color { color(.signalSuccess) }
    static var signalWarning: Color { color(.signalWarning) }
    static var signalDelete: Color { color(.signalDelete) }
    static var signalError: Color { color(.signalError) }

    // MARK: SignalText

    static var signalSuccessText: Color { color(.signalSuccessText) }
    static var signalWarningText: Color { color(.signalWarningText) }
    static var signalDeleteText: Color { color(.signalDeleteText) }
    static var signalErrorText: Color { color(.signalErrorText) }

    // MARK: UI

    static var border: Color { color(.border) }
    static var graphicalElements1: Color { color(.graphicalElements1) }
    static var graphicalElements2: Color { color(.graphicalElements2) }
    static var graphicalElements3: Color { color(.graphicalElements3) }
    static var shimmer: Color { color(.shimmer) }
    static var tabs: Color { color(.tabs) }

    // MARK: "On" colors

    // used in text and icons "on" top of another color

    static var onPrimary: Color { color(.onPrimary) }
    static var onPrimaryDisabled: Color { color(.onPrimaryDisabled) }

    static var onSecondary: Color { color(.onSecondary) }
    static var onSecondaryDisabled: Color { color(.onSecondaryDisabled) }

    static var onClean: Color { color(.onClean) }
    static var onCleanDisabled: Color { color(.onCleanDisabled) }

    static var onCleanSecondary: Color { color(.onCleanSecondary) }
    static var onCleanSecondaryDisabled: Color { color(.onCleanSecondaryDisabled) }

    static var onCta: Color { color(.onCta) }
    static var onCtaDisabled: Color { color(.onCtaDisabled) }

    static var onNonText: Color { color(.onNonText) }
    static var onSignal: Color { color(.onSignal) }
    static var onWaitlist: Color { color(.onWaitlist) }

    static var onBackgroundEnabledOn: Color { color(.onBackgroundEnabledOn) }
    static var onBackgroundEnabledOff: Color { color(.onBackgroundEnabledOff) }
    static var onBackgroundDisabledOn: Color { color(.onBackgroundDisabledOn) }
    static var onBackgroundDisabledOff: Color { color(.onBackgroundDisabledOff) }
    static var onBackgroundPrimary: Color { color(.onBackgroundPrimary) }
    static var onBackgroundSecondary: Color { color(.onBackgroundSecondary) }
    static var onBackgroundDisabled: Color { color(.onBackgroundDisabled) }

    static var onSurfaceEnabledOn: Color { color(.onSurfaceEnabledOn) }
    static var onSurfaceEnabledOff: Color { color(.onSurfaceEnabledOff) }
    static var onSurfaceDisabledOn: Color { color(.onSurfaceDisabledOn) }
    static var onSurfaceDisabledOff: Color { color(.onSurfaceDisabledOff) }
    static var onSurfacePrimary: Color { color(.onSurfacePrimary) }
    static var onSurfaceSecondary: Color { color(.onSurfaceSecondary) }
    static var onSurfaceDisabled: Color { color(.onSurfaceDisabled) }

    static var onGradientPrimary: Color { color(.onGradientPrimary) }
    static var onGradientSecondary: Color { color(.onGradientSecondary) }
    static var onGradientDisabled: Color { color(.onGradientDisabled) }

    // MARK: Theme dependant colors

    // these colors are prefixed with "sats" as Color.secondary already exists
    // in SwiftUI
    static var satsPrimary: Color { themedColor(.primary) }
    static var satsPrimaryHighlight: Color { themedColor(.primaryHighlight) }
    static var satsPrimaryDisabled: Color { themedColor(.primaryDisabled) }

    static var selection: Color { themedColor(.selection) }

    static var backgroundTopStart: Color { themedColor(.backgroundTopStart) }
    static var backgroundTopEnd: Color { themedColor(.backgroundTopEnd) }

    static var navigationPrimary: Color { themedColor(.navigation) }

    // MARK: Challenge colors

    static var challengeFailed: Color { color(.challengeFailed) }
    static var challengeInProgress: Color { color(.challengeInProgress) }
    static var challengeNotDone: Color { color(.challengeNotDone) }
    static var challengeSuccess: Color { color(.challengeSuccess) }

    // MARK: Private

    private static func themedColor(_ name: ColorName) -> Color {
        // we use colors with a dynamic provider to re-evaluate colors when the theme changes
        let dynamicColor = UIColor { _ in
            guard let uiColor = ColorTheme.current[name] else {
                preconditionFailure("❌ \(name.rawValue) should be present in theme \(ColorTheme.current.name)")
            }

            return uiColor
        }
        return Color(dynamicColor)
    }

    private static func color(_ name: ColorName) -> Color {
        Color(name.rawValue, bundle: .module)
    }
}
