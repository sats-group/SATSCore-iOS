import XCTest
@testable import SATSCore

class ColorsTests: XCTestCase {
    /// To ensure we expose the named colors as easy to access class variables in UIColor
    /// Then a color like `ColorName.backgroundPrimary` is available as `UIColor.backgroundPrimary`
    func testAllNamedColorsAreExposedAsClassVariables() {
        XCTAssertEqual(colorConstants().count, ColorName.allCases.count)
    }

    // swiftlint:disable:next function_body_length
    private func colorConstants() -> [UIColor] {
        [
            .backgroundPrimary,
            .backgroundSecondary,
            .backgroundSurfacePrimary,
            .backgroundSurfaceSecondary,

            .secondary,
            .secondaryHighlight,
            .secondaryDisabled,

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

            .signalSuccess,
            .signalWarning,
            .signalDelete,
            .signalError,

            .signalSuccessText,
            .signalWarningText,
            .signalDeleteText,
            .signalErrorText,

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

            .onGradientPrimary,
            .onGradientSecondary,
            .onGradientDisabled,

            .primary,
            .primaryHighlight,
            .primaryDisabled,

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
            .rewardsPlatinum
        ]
    }
}
