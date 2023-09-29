import SwiftUI

public extension Color {
    static var satsPrimary: Color { color(.primary) }
    static var satsPrimaryHighlight: Color { color(.primaryHighlight) }
    static var satsPrimaryDisabled: Color { color(.primaryDisabled) }

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

    // MARK: Action

    static var action: Color { color(.action) }
    static var actionHighlight: Color { color(.actionHighlight) }
    static var actionDisabled: Color { color(.actionDisabled) }

    // MARK: Waitlist

    static var waitlist: Color { color(.waitlist) }
    static var waitlistHighlight: Color { color(.waitlistHighlight) }
    static var waitlistDisabled: Color { color(.waitlistDisabled) }
    static var waitlistText: Color { color(.waitlistText) }

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
    static var graphicalElements4: Color { color(.graphicalElements4) }
    static var graphicalElements5: Color { color(.graphicalElements5) }
    static var graphicalElements6: Color { color(.graphicalElements6) }
    static var graphicalElements7: Color { color(.graphicalElements7) }
    static var shimmer: Color { color(.shimmer) }
    static var tabs: Color { color(.tabs) }
    static var navigation: Color { color(.navigation) }

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
    static var onRewards: Color { color(.onRewards) }
    static var onWaitlistDisabled: Color { color(.onWaitlistDisabled) }

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

    // MARK: Challenge colors

    static var challengeFailed: Color { color(.challengeFailed) }
    static var challengeInProgress: Color { color(.challengeInProgress) }
    static var challengeNotDone: Color { color(.challengeNotDone) }
    static var challengeSuccess: Color { color(.challengeSuccess) }

    // MARK: Workouts

    static var workoutPt: Color { color(.workoutPt) }
    static var workoutGx: Color { color(.workoutGx) }
    static var workoutGymfloor: Color { color(.workoutGymfloor) }
    static var workoutOwnTraining: Color { color(.workoutOwnTraining) }

    // MARK: Rewards

    static var rewardsBlue: Color { color(.rewardsBlue) }
    static var rewardsSilver: Color { color(.rewardsSilver) }
    static var rewardsGold: Color { color(.rewardsGold) }
    static var rewardsPlatinum: Color { color(.rewardsPlatinum) }

    private static func color(_ name: ColorName) -> Color {
        Color(name.rawValue, bundle: .module)
    }
}
