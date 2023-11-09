import UIKit

// swiftlint:disable line_length
extension UIColor {
    // MARK: - Buttons

    public static var primaryButton: UIColor { satsColor(for: .primaryButton) }
    public static var primaryButtonHighlight: UIColor { satsColor(for: .primaryButtonHighlight) }
    public static var primaryButtonDisabled: UIColor { satsColor(for: .primaryButtonDisabled) }

    public static var secondaryButton: UIColor { satsColor(for: .secondaryButton) }
    public static var secondaryButtonHighlight: UIColor { satsColor(for: .secondaryButtonHighlight) }
    public static var secondaryButtonDisabled: UIColor { satsColor(for: .secondaryButtonDisabled) }

    public static var cleanButton: UIColor { satsColor(for: .cleanButton) }
    public static var cleanButtonHighlight: UIColor { satsColor(for: .cleanButtonHighlight) }
    public static var cleanButtonDisabled: UIColor { satsColor(for: .cleanButtonDisabled) }

    public static var cleanSecondaryButton: UIColor { satsColor(for: .cleanSecondaryButton) }
    public static var cleanSecondaryButtonHighlight: UIColor { satsColor(for: .cleanSecondaryButtonHighlight) }
    public static var cleanSecondaryButtonDisabled: UIColor { satsColor(for: .cleanSecondaryButtonDisabled) }

    public static var ctaButton: UIColor { satsColor(for: .ctaButton) }
    public static var ctaButtonHighlight: UIColor { satsColor(for: .ctaButtonHighlight) }
    public static var ctaButtonDisabled: UIColor { satsColor(for: .ctaButtonDisabled) }

    public static var action: UIColor { satsColor(for: .action) }
    public static var actionHighlight: UIColor { satsColor(for: .actionHighlight) }
    public static var actionDisabled: UIColor { satsColor(for: .actionDisabled) }

    public static var waitingListButton: UIColor { satsColor(for: .waitingListButton) }
    public static var waitingListButtonHighlight: UIColor { satsColor(for: .waitingListButtonHighlight) }
    public static var waitingListButtonDisabled: UIColor { satsColor(for: .waitingListButtonDisabled) }

    public static var deleteButton: UIColor { satsColor(for: .deleteButton) }
    public static var deleteButtonHighlight: UIColor { satsColor(for: .deleteButtonHighlight) }
    public static var deleteButtonDisabled: UIColor { satsColor(for: .deleteButtonDisabled) }

    // MARK: - Graphical Elements

    // MARK: Divider

    public static var divider: UIColor { satsColor(for: .divider) }
    public static var dividerAlternate: UIColor { satsColor(for: .dividerAlternate) }

    // MARK: Skeleton

    public static var skeleton: UIColor { satsColor(for: .skeleton) }

    // MARK: Nav Bar

    public static var navBarSelected: UIColor { satsColor(for: .navBarSelected) }
    public static var navBarNotSelected: UIColor { satsColor(for: .navBarNotSelected) }

    // MARK: Progress Bar

    public static var progressBarIndicator: UIColor { satsColor(for: .progressBarIndicator) }
    public static var progressBarBackground: UIColor { satsColor(for: .progressBarBackground) }

    // MARK: Graphs

    public static var graphBarPrimary: UIColor { satsColor(for: .graphBarPrimary) }
    public static var graphBarSecondary: UIColor { satsColor(for: .graphBarSecondary) }
    public static var graphBackgroundPrimary: UIColor { satsColor(for: .graphBackgroundPrimary) }
    public static var graphBackgroundSecondary: UIColor { satsColor(for: .graphBackgroundSecondary) }
    public static var graphUpwardsTrend: UIColor { satsColor(for: .graphUpwardsTrend) }
    public static var graphNeutralTrend: UIColor { satsColor(for: .graphNeutralTrend) }
    public static var graphDownwardsTrend: UIColor { satsColor(for: .graphDownwardsTrend) }

    // MARK: Selector

    public static var selectorUnselected: UIColor { satsColor(for: .selectorUnselected) }
    public static var selectorUnselectedDisabled: UIColor { satsColor(for: .selectorUnselectedDisabled) }

    public static var selectorSelected: UIColor { satsColor(for: .selectorSelected) }
    public static var selectorSelectedDisabled: UIColor { satsColor(for: .selectorSelectedDisabled) }

    // MARK: Toggle

    public static var toggleUnselected: UIColor { satsColor(for: .toggleUnselected) }
    public static var toggleUnselectedDisabled: UIColor { satsColor(for: .toggleUnselectedDisabled) }
    public static var toggleInteractiveElement: UIColor { satsColor(for: .toggleInteractiveElement) }
    public static var toggleSelected: UIColor { satsColor(for: .toggleSelected) }
    public static var toggleSelectedDisabled: UIColor { satsColor(for: .toggleSelectedDisabled) }

    // MARK: Icons

    public static var iconPrimary: UIColor { satsColor(for: .iconPrimary) }
    public static var iconSecondary: UIColor { satsColor(for: .iconSecondary) }
    public static var iconFixed: UIColor { satsColor(for: .iconFixed) }
    public static var iconPositive: UIColor { satsColor(for: .iconPositive) }
    public static var iconAttention: UIColor { satsColor(for: .iconAttention) }
    public static var iconNegative: UIColor { satsColor(for: .iconNegative) }
    public static var iconWaitingList: UIColor { satsColor(for: .iconWaitingList) }
    public static var iconDelete: UIColor { satsColor(for: .iconDelete) }

    // MARK: Indicators

    public static var indicatorPositive: UIColor { satsColor(for: .indicatorPositive) }
    public static var indicatorPositiveAlternate: UIColor { satsColor(for: .indicatorPositiveAlternate) }

    public static var indicatorAttention: UIColor { satsColor(for: .indicatorAttention) }
    public static var indicatorAttentionAlternate: UIColor { satsColor(for: .indicatorAttentionAlternate) }

    public static var indicatorNegative: UIColor { satsColor(for: .indicatorNegative) }
    public static var indicatorNegativeAlternate: UIColor { satsColor(for: .indicatorNegativeAlternate) }

    public static var indicatorNeutralList: UIColor { satsColor(for: .indicatorNeutralList) }
    public static var indicatorNeutralListAlternate: UIColor { satsColor(for: .indicatorNeutralListAlternate) }

    // MARK: Signal

    public static var signalSuccess: UIColor { satsColor(for: .signalSuccess) }
    public static var signalWarning: UIColor { satsColor(for: .signalWarning) }
    public static var signalError: UIColor { satsColor(for: .signalError) }
    public static var signalNeutral: UIColor { satsColor(for: .signalNeutral) }
    public static var signalWaitingList: UIColor { satsColor(for: .signalWaitingList) }

    // MARK: Tags

    public static var tagPrimary: UIColor { satsColor(for: .tagPrimary) }
    public static var tagSecondary: UIColor { satsColor(for: .tagSecondary) }
    public static var tagFeatured: UIColor { satsColor(for: .tagFeatured) }

    // MARK: Rewards

    public static var rewardsBlue: UIColor { satsColor(for: .rewardsBlue) }
    public static var rewardsSilver: UIColor { satsColor(for: .rewardsSilver) }
    public static var rewardsGold: UIColor { satsColor(for: .rewardsGold) }
    public static var rewardsPlatinum: UIColor { satsColor(for: .rewardsPlatinum) }

    // MARK: Workouts

    public static var workoutPt: UIColor { satsColor(for: .workoutPt) }
    public static var workoutGx: UIColor { satsColor(for: .workoutGx) }
    public static var workoutTreatments: UIColor { satsColor(for: .workoutTreatments) }
    public static var workoutGymfloor: UIColor { satsColor(for: .workoutGymfloor) }
    public static var workoutOwnTraining: UIColor { satsColor(for: .workoutOwnTraining) }

    // MARK: - Backgrounds and Surfaces

    // MARK: Background

    public static var backgroundPrimary: UIColor { satsColor(for: .backgroundPrimary) }
    public static var backgroundSecondary: UIColor { satsColor(for: .backgroundSecondary) }
    public static var backgroundFixed: UIColor { satsColor(for: .backgroundFixed) }

    // MARK: Surface

    public static var surfacePrimary: UIColor { satsColor(for: .surfacePrimary) }
    public static var surfaceSecondary: UIColor { satsColor(for: .surfaceSecondary) }
    public static var surfaceFixed: UIColor { satsColor(for: .surfaceFixed) }

    // MARK: Signal Surface

    public static var signalSurfaceSuccess: UIColor { satsColor(for: .signalSurfaceSuccess) }
    public static var signalSurfaceWarning: UIColor { satsColor(for: .signalSurfaceWarning) }
    public static var signalSurfaceError: UIColor { satsColor(for: .signalSurfaceError) }
    public static var signalSurfaceWaitingList: UIColor { satsColor(for: .signalSurfaceWaitingList) }
    public static var signalSurfaceNeutral: UIColor { satsColor(for: .signalSurfaceNeutral) }

    // MARK: - "On" Colors

    // MARK: On Buttons

    public static var onPrimaryButton: UIColor { satsColor(for: .onPrimaryButton) }
    public static var onPrimaryButtonDisabled: UIColor { satsColor(for: .onPrimaryButtonDisabled) }

    public static var onSecondaryButton: UIColor { satsColor(for: .onSecondaryButton) }
    public static var onSecondaryButtonDisabled: UIColor { satsColor(for: .onSecondaryButtonDisabled) }

    public static var onCleanButton: UIColor { satsColor(for: .onCleanButton) }
    public static var onCleanButtonDisabled: UIColor { satsColor(for: .onCleanButtonDisabled) }

    public static var onCleanSecondaryButton: UIColor { satsColor(for: .onCleanSecondaryButton) }
    public static var onCleanSecondaryButtonDisabled: UIColor { satsColor(for: .onCleanSecondaryButtonDisabled) }

    public static var onCtaButton: UIColor { satsColor(for: .onCtaButton) }
    public static var onCtaButtonDisabled: UIColor { satsColor(for: .onCtaButtonDisabled) }

    public static var onWaitingListButton: UIColor { satsColor(for: .onWaitingListButton) }
    public static var onWaitingListButtonDisabled: UIColor { satsColor(for: .onWaitingListButtonDisabled) }

    public static var onDeleteButton: UIColor { satsColor(for: .onDeleteButton) }
    public static var onDeleteButtonDisabled: UIColor { satsColor(for: .onDeleteButtonDisabled) }

    // MARK: On Tags

    public static var onTagPrimary: UIColor { satsColor(for: .onTagPrimary) }
    public static var onTagSecondary: UIColor { satsColor(for: .onTagSecondary) }
    public static var onTagFeatured: UIColor { satsColor(for: .onTagFeatured) }

    // MARK: On Rewards

    public static var onReward: UIColor { satsColor(for: .onReward) }

    // MARK: On Background

    public static var onBackgroundPrimary: UIColor { satsColor(for: .onBackgroundPrimary) }
    public static var onBackgroundPrimaryAlternate: UIColor { satsColor(for: .onBackgroundPrimaryAlternate) }
    public static var onBackgroundPrimaryDisabled: UIColor { satsColor(for: .onBackgroundPrimaryDisabled) }

    public static var onBackgroundSecondary: UIColor { satsColor(for: .onBackgroundSecondary) }
    public static var onBackgroundSecondaryAlternate: UIColor { satsColor(for: .onBackgroundSecondaryAlternate) }
    public static var onBackgroundSecondaryDisabled: UIColor { satsColor(for: .onBackgroundSecondaryDisabled) }

    public static var onBackgroundTertiary: UIColor { satsColor(for: .onBackgroundTertiary) }
    public static var onBackgroundTertiaryAlternate: UIColor { satsColor(for: .onBackgroundTertiaryAlternate) }
    public static var onBackgroundTertiaryDisabled: UIColor { satsColor(for: .onBackgroundTertiaryDisabled) }

    // MARK: On Surface

    public static var onSurfacePrimary: UIColor { satsColor(for: .onSurfacePrimary) }
    public static var onSurfacePrimaryAlternate: UIColor { satsColor(for: .onSurfacePrimaryAlternate) }
    public static var onSurfacePrimaryDisabled: UIColor { satsColor(for: .onSurfacePrimaryDisabled) }
    public static var onSurfacePrimarySelected: UIColor { satsColor(for: .onSurfacePrimarySelected) }

    public static var onSurfaceSecondary: UIColor { satsColor(for: .onSurfaceSecondary) }
    public static var onSurfaceSecondaryAlternate: UIColor { satsColor(for: .onSurfaceSecondaryAlternate) }
    public static var onSurfaceSecondaryDisabled: UIColor { satsColor(for: .onSurfaceSecondaryDisabled) }

    public static var onSurfaceFixed: UIColor { satsColor(for: .onSurfaceFixed) }
    public static var onSurfaceFixedAlternate: UIColor { satsColor(for: .onSurfaceFixedAlternate) }
    public static var onSurfaceFixedDisabled: UIColor { satsColor(for: .onSurfaceFixedDisabled) }

    public static var onSurfaceSuccess: UIColor { satsColor(for: .onSurfaceSuccess) }
    public static var onSurfaceWarning: UIColor { satsColor(for: .onSurfaceWarning) }
    public static var onSurfaceError: UIColor { satsColor(for: .onSurfaceError) }
    public static var onSurfaceWaitingList: UIColor { satsColor(for: .onSurfaceWaitingList) }
    public static var onSurfaceNeutral: UIColor { satsColor(for: .onSurfaceNeutral) }

    // MARK: On Signal Surface

    public static var onSignalSurfaceSuccess: UIColor { satsColor(for: .onSignalSurfaceSuccess) }
    public static var onSignalSurfaceSuccessAlternate: UIColor { satsColor(for: .onSignalSurfaceSuccessAlternate) }

    public static var onSignalSurfaceWarning: UIColor { satsColor(for: .onSignalSurfaceWarning) }
    public static var onSignalSurfaceWarningAlternate: UIColor { satsColor(for: .onSignalSurfaceWarningAlternate) }

    public static var onSignalSurfaceError: UIColor { satsColor(for: .onSignalSurfaceError) }
    public static var onSignalSurfaceErrorAlternate: UIColor { satsColor(for: .onSignalSurfaceErrorAlternate) }

    public static var onSignalSurfaceWaitingList: UIColor { satsColor(for: .onSignalSurfaceWaitingList) }
    public static var onSignalSurfaceWaitingListAlternate: UIColor { satsColor(for: .onSignalSurfaceWaitingListAlternate) }

    public static var onSignalSurfaceNeutral: UIColor { satsColor(for: .onSignalSurfaceNeutral) }
    public static var onSignalSurfaceNeutralAlternate: UIColor { satsColor(for: .onSignalSurfaceNeutralAlternate) }
}
// swiftlint:enable line_length

private extension UIColor {
    static func satsColor(for colorName: SATSColorName) -> UIColor {
        colorName.definition.uiColor
    }
}
