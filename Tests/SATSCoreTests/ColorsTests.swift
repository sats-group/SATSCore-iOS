import XCTest
@testable import SATSCore

class ColorsTests: XCTestCase {
    /// To ensure we expose the named colors as easy to access class variables in UIColor
    /// Then a color like `ColorName.backgroundPrimary` is available as `UIColor.backgroundPrimary`
    func testAllNamedColorsAreExposedAsClassVariables() {
        XCTAssertEqual(colorConstants().count, ColorName.allCases.count)
    }

    func testColorResolutionWhenChaingTheme() {
        let initialValue = UIColor.primary.hexString ?? ""

        ColorTheme.current = .platinum

        let newValue = UIColor.primary.hexString ?? ""

        XCTAssertNotEqual(initialValue, newValue)
    }

    // swiftlint:disable:next function_body_length
    private func colorConstants() -> [UIColor] {
        [
            .backgroundPrimary,
            .backgroundSecondary,
            .backgroundSurface,

            .secondary,
            .secondaryHighlight,
            .secondaryDisabled,
            .clean,

            .cta,
            .ctaHighlight,
            .ctaDisabled,
            .nonText,

            .waitlist,
            .waitlistHighlight,

            .link,
            .linkHighlight,

            .signalSuccess,
            .signalWarning,
            .signalDelete,
            .signalError,

            .border,
            .shimmer,
            .tabs,

            .onPrimary,
            .onPrimaryDisabled,
            .onSecondary,
            .onSecondaryDisabled,
            .onCta,
            .onCtaDisabled,
            .onNonText,
            .onSignal,
            .onWaitlist,

            .onBackgroundEnabledOn,
            .onBackgroundEnabledOff,
            .onBackgroundDisabledOn,
            .onBackgroundDisabledOff,
            .onBackgroundPrimary,
            .onBackgroundSecondary,
            .onBackgroundDisabled,

            .onSurfaceEnabledOn,
            .onSurfaceEnabledOff,
            .onSurfaceDisabledOn,
            .onSurfaceDisabledOff,
            .onSurfacePrimary,
            .onSurfaceSecondary,
            .onSurfaceDisabled,

            .onGradientPrimary,
            .onGradientSecondary,
            .onGradientDisabled,

            .primary,
            .primaryHighlight,
            .primaryDisabled,

            .selection,

            .backgroundTopStart,
            .backgroundTopEnd,
        ]
    }
}
