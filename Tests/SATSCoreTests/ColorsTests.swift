import XCTest
@testable import SATSCore

class ColorsTests: XCTestCase {
    /// To ensure we expose the named colors as easy to access class variables in UIColor
    /// Then a color like `ColorName.backgroundPrimary` is available as `UIColor.backgroundPrimary`
    func testAllNamedColorsAreExposedAsClassVariables() {
        XCTAssertEqual(colorConstants().count, ColorName.allCases.count)
    }

    private func colorConstants() -> [UIColor] {
        [
            .backgroundPrimary,
            .backgroundSecondary,
            .backgroundShimmer,
            .backgroundTabbar,
            .backgroundSurfaceStart,
            .backgroundSurfaceEnd,

            .buttonPrimary,
            .buttonPrimaryHighlight,
            .buttonPrimaryDisabled,
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
        ]
    }
}
