import XCTest
import SATSCore

class ColorsTests: XCTestCase {
    func testColorsCanBeFound() {
        let checkColors: () -> Bool = {
            let colors: [UIColor] = [
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

                .link,

                .signalSuccess,
                .signalWarning,
                .signalDelete,
                .signalError,

                .border,
            ]

            return !colors.isEmpty
        }

        XCTAssertNoThrow(checkColors())
    }
}
