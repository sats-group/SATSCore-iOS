import Foundation

/// Static list of color names defined in the Assets folder to avoid misspelling them
enum ColorName: String, CaseIterable {
    case backgroundPrimary
    case backgroundSecondary
    case backgroundSurfacePrimary
    case backgroundSurfaceSecondary

    case secondary
    case secondaryHighlight
    case secondaryDisabled

    case clean
    case cleanHighlight
    case cleanDisabled

    case cleanSecondary
    case cleanSecondaryHighlight
    case cleanSecondaryDisabled

    case cta
    case ctaHighlight
    case ctaDisabled
    case nonText

    case waitlist
    case waitlistHighlight
    case waitlistDisabled
    case waitlistText
    case waitlistBackground

    case signalSuccess
    case signalWarning
    case signalDelete
    case signalError

    case signalSuccessText
    case signalWarningText
    case signalDeleteText
    case signalErrorText

    case signalSuccessBackground
    case signalWarningBackground
    case signalDeleteBackground
    case signalErrorBackground

    case border
    case graphicalElements1
    case graphicalElements2
    case graphicalElements3
    case graphicalElements4
    case graphicalElements5
    case graphicalElements6
    case graphicalElements7
    case shimmer
    case tabs

    // "On" colors

    case onPrimary
    case onPrimaryDisabled

    case onSecondary
    case onSecondaryDisabled

    case onClean
    case onCleanDisabled

    case onCleanSecondary
    case onCleanSecondaryDisabled

    case onCta
    case onCtaDisabled

    case onNonText
    case onSignal
    case onRewards
    case onWaitlist
    case onWaitlistDisabled

    case onBackgroundEnabledOn
    case onBackgroundEnabledOff
    case onBackgroundDisabledOn
    case onBackgroundDisabledOff
    case onBackgroundPrimary
    case onBackgroundSecondary
    case onBackgroundDisabled

    case onSurfaceEnabledOn
    case onSurfaceEnabledOff
    case onSurfaceDisabledOn
    case onSurfaceDisabledOff
    case onSurfacePrimary
    case onSurfaceSecondary
    case onSurfaceDisabled

    case primary
    case primaryHighlight
    case primaryDisabled

    case action
    case actionHighlight
    case actionDisabled

    case navigation

    // Challenge colors

    case challengeFailed
    case challengeInProgress
    case challengeNotDone
    case challengeSuccess

    // Workouts

    case workoutPt
    case workoutGx
    case workoutGymfloor
    case workoutOwnTraining

    // Rewards

    case rewardsBlue
    case rewardsSilver
    case rewardsGold
    case rewardsPlatinum
}
