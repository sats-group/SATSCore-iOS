import XCTest
import SwiftUI
@testable import SATSCore

class ColorsTests: XCTestCase {
    /// To ensure we expose the named colors as easy to access class variables in UIColor
    /// Then a color like `ColorName.backgroundPrimary` is available as `UIColor.backgroundPrimary`
    func testAllNamedColorsAreExposedAsClassVariables() {
//        XCTAssertEqual(colorConstants().count, ColorName.allCases.count)
    }

    func testColorPrimitives() {
        ColorPrimitive.allCases.forEach { primitive in
            _ = primitive.uiColor
        }
    }

    // swiftlint:disable:next function_body_length
    private func colorConstants() -> [Color] {
        [
            .backgroundPrimary,
            .backgroundSecondary,
            .backgroundSurfacePrimary,
            .backgroundSurfaceSecondary,

            .satsSecondary,
            .satsSecondaryHighlight,
            .satsSecondaryDisabled,

            .clean,
            .cleanHighlight,
            .cleanDisabled,

            .cleanSecondary,
            .cleanSecondaryHighlight,
            .cleanSecondaryDisabled,

            .cta,
            .ctaHighlight,
            .ctaDisabled,
            .nonText,

            .action,
            .actionHighlight,
            .actionDisabled,

            .waitlist,
            .waitlistHighlight,
            .waitlistDisabled,
            .waitlistText,
            .waitlistBackground,

            .signalSuccess,
            .signalWarning,
            .signalDelete,
            .signalError,

            .signalSuccessText,
            .signalWarningText,
            .signalDeleteText,
            .signalErrorText,

            .signalSuccessBackground,
            .signalWarningBackground,
            .signalDeleteBackground,
            .signalErrorBackground,

            .border,
            .graphicalElements1,
            .graphicalElements2,
            .graphicalElements3,
            .graphicalElements4,
            .graphicalElements5,
            .graphicalElements6,
            .graphicalElements7,
            .shimmer,
            .tabs,

            .onPrimary,
            .onPrimaryDisabled,
            .onSecondary,
            .onSecondaryDisabled,
            .onClean,
            .onCleanDisabled,
            .onCleanSecondary,
            .onCleanSecondaryDisabled,
            .onCta,
            .onCtaDisabled,
            .onNonText,
            .onSignal,
            .onWaitlist,
            .onRewards,
            .onWaitlistDisabled,

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

            .satsPrimary,
            .satsPrimaryHighlight,
            .satsPrimaryDisabled,

            .navigation,

            .challengeFailed,
            .challengeInProgress,
            .challengeNotDone,
            .challengeSuccess,

            .workoutPt,
            .workoutGx,
            .workoutGymfloor,
            .workoutOwnTraining,

            .rewardsBlue,
            .rewardsSilver,
            .rewardsGold,
            .rewardsPlatinum,
        ]
    }
}
