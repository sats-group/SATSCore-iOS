import Foundation

public enum SATSColorName: String, CaseIterable {
    // MARK: - Buttons

    case primaryButton
    case primaryButtonHighlight
    case primaryButtonDisabled

    case secondaryButton
    case secondaryButtonHighlight
    case secondaryButtonDisabled

    case cleanButton
    case cleanButtonHighlight
    case cleanButtonDisabled

    case cleanSecondaryButton
    case cleanSecondaryButtonHighlight
    case cleanSecondaryButtonDisabled

    case ctaButton
    case ctaButtonHighlight
    case ctaButtonDisabled

    case action
    case actionHighlight
    case actionDisabled

    case waitingListButton
    case waitingListButtonHighlight
    case waitingListButtonDisabled

    case deleteButton
    case deleteButtonHighlight
    case deleteButtonDisabled

    // MARK: - Graphical Elements

    // MARK: Divider

    case divider
    case dividerAlternate

    // MARK: Skeleton

    case skeleton

    // MARK: Nav bar

    case navBarSelected
    case navBarNotSelected

    // MARK: Progress Bar

    case progressBarIndicator
    case progressBarBackground

    // MARK: Graphs

    case graphBarPrimary
    case graphBarSecondary
    case graphBackgroundPrimary
    case graphBackgroundSecondary
    case graphUpwardsTrend
    case graphNeutralTrend
    case graphDownwardsTrend

    // MARK: Selector

    case selectorUnselected
    case selectorUnselectedDisabled

    case selectorSelected
    case selectorSelectedDisabled

    // MARK: Toggle

    case toggleUnselected
    case toggleUnselectedDisabled
    case toggleInteractiveElement
    case toggleSelected
    case toggleSelectedDisabled

    // MARK: Icons

    case iconPrimary
    case iconSecondary
    case iconFixed
    case iconPositive
    case iconAttention
    case iconNegative
    case iconWaitingList
    case iconDelete

    // MARK: Indicators

    case indicatorPositive
    case indicatorPositiveAlternate

    case indicatorAttention
    case indicatorAttentionAlternate

    case indicatorNegative
    case indicatorNegativeAlternate

    case indicatorNeutralList
    case indicatorNeutralListAlternate

    // MARK: Signal

    case signalSuccess
    case signalWarning
    case signalError
    case signalNeutral
    case signalWaitingList

    // MARK: Tags

    case tagPrimary
    case tagSecondary
    case tagFeatured

    // MARK: Rewards

    case rewardsBlue
    case rewardsSilver
    case rewardsGold
    case rewardsPlatinum

    // MARK: Workouts

    case workoutPt
    case workoutGx
    case workoutTreatments
    case workoutGymfloor
    case workoutOwnTraining

    // MARK: - Backgrounds and Surfaces

    // MARK: Background

    case backgroundPrimary
    case backgroundSecondary
    case backgroundFixed

    // MARK: Surface

    case surfacePrimary
    case surfaceSecondary
    case surfaceFixed

    // MARK: Signal Surface

    case signalSurfaceSuccess
    case signalSurfaceWarning
    case signalSurfaceError
    case signalSurfaceWaitingList
    case signalSurfaceNeutral

    // MARK: - "On" Colors

    // MARK: On Buttons

    case onPrimaryButton
    case onPrimaryButtonDisabled

    case onSecondaryButton
    case onSecondaryButtonDisabled

    case onCleanButton
    case onCleanButtonDisabled

    case onCleanSecondaryButton
    case onCleanSecondaryButtonDisabled

    case onCtaButton
    case onCtaButtonDisabled

    case onWaitingListButton
    case onWaitingListButtonDisabled

    case onDeleteButton
    case onDeleteButtonDisabled

    // MARK: On Tags

    case onTagPrimary
    case onTagSecondary
    case onTagFeatured

    // MARK: On Rewards

    case onReward

    // MARK: On Background

    case onBackgroundPrimary
    case onBackgroundPrimaryAlternate
    case onBackgroundPrimaryDisabled

    case onBackgroundSecondary
    case onBackgroundSecondaryAlternate
    case onBackgroundSecondaryDisabled

    case onBackgroundTertiary
    case onBackgroundTertiaryAlternate
    case onBackgroundTertiaryDisabled

    // MARK: On Surface

    case onSurfacePrimary
    case onSurfacePrimaryAlternate
    case onSurfacePrimaryDisabled
    case onSurfacePrimarySelected

    case onSurfaceSecondary
    case onSurfaceSecondaryAlternate
    case onSurfaceSecondaryDisabled

    case onSurfaceFixed
    case onSurfaceFixedAlternate
    case onSurfaceFixedDisabled

    case onSurfaceSuccess
    case onSurfaceWarning
    case onSurfaceError
    case onSurfaceWaitingList
    case onSurfaceNeutral

    // MARK: On Signal Surface

    case onSignalSurfaceSuccess
    case onSignalSurfaceSuccessAlternate

    case onSignalSurfaceWarning
    case onSignalSurfaceWarningAlternate

    case onSignalSurfaceError
    case onSignalSurfaceErrorAlternate

    case onSignalSurfaceWaitingList
    case onSignalSurfaceWaitingListAlternate

    case onSignalSurfaceNeutral
    case onSignalSurfaceNeutralAlternate
}
