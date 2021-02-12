import XCTest
@testable import SATSCore

class ColorsTests: XCTestCase {
    /// To ensure we expose the named colors as easy to access class variables in UIColor
    /// Then a color like `ColorName.backgroundPrimary` is available as `UIColor.backgroundPrimary`
    func testAllNamedColorsAreExposedAsClassVariables() {
        XCTAssertEqual(colorConstants().count, ColorName.allCases.count)
    }

    func testColorResolutionWhenChaingTheme() {
        let initialValue = UIColor.buttonPrimary.hexString ?? ""

        ColorTheme.current = .platinum

        let newValue = UIColor.buttonPrimary.hexString ?? ""

        XCTAssertNotEqual(initialValue, newValue)
    }

    private func colorConstants() -> [UIColor] {
        [
            .backgroundPrimary,
            .backgroundSecondary,
            .backgroundShimmer,
            .backgroundTabbar,
            .backgroundSurfaceStart,
            .backgroundSurfaceEnd,

            .buttonSecondary,
            .buttonSecondaryHighlight,
            .buttonSecondaryDisabled,
            .buttonCta,
            .buttonCtaHighlight,
            .buttonCtaDisabled,

            .onButtonPrimary,
            .onButtonPrimarySecondary,
            .onButtonSecondary,
            .onButtonSecondarySecondary,
            .onButtonCta,
            .onButtonCtaSecondary,
            .onBackgroundSurface,
            .onBackgroundSurfaceSecondary,
            .onBackgroundPrimary,
            .onBackgroundPrimarySecondary,

            .waitlist,
            .waitlistHighlight,

            .link,
            .linkHighlight,

            .signalSuccess,
            .signalWarning,
            .signalDelete,
            .signalError,

            .border,

            .buttonPrimary,
            .buttonPrimaryHighlight,
            .buttonPrimaryDisabled,

            .selection,

            .backgroundTopStart,
            .backgroundTopEnd,
        ]
    }
}
