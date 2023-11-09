import SwiftUI

// swiftlint:disable line_length
extension Color {
    // MARK: - Buttons

    public static var primaryButton: Color { satsColor(for: .primaryButton) }
    public static var primaryButtonHighlight: Color { satsColor(for: .primaryButtonHighlight) }
    public static var primaryButtonDisabled: Color { satsColor(for: .primaryButtonDisabled) }

    public static var secondaryButton: Color { satsColor(for: .secondaryButton) }
    public static var secondaryButtonHighlight: Color { satsColor(for: .secondaryButtonHighlight) }
    public static var secondaryButtonDisabled: Color { satsColor(for: .secondaryButtonDisabled) }

    public static var cleanButton: Color { satsColor(for: .cleanButton) }
    public static var cleanButtonHighlight: Color { satsColor(for: .cleanButtonHighlight) }
    public static var cleanButtonDisabled: Color { satsColor(for: .cleanButtonDisabled) }

    public static var cleanSecondaryButton: Color { satsColor(for: .cleanSecondaryButton) }
    public static var cleanSecondaryButtonHighlight: Color { satsColor(for: .cleanSecondaryButtonHighlight) }
    public static var cleanSecondaryButtonDisabled: Color { satsColor(for: .cleanSecondaryButtonDisabled) }

    public static var ctaButton: Color { satsColor(for: .ctaButton) }
    public static var ctaButtonHighlight: Color { satsColor(for: .ctaButtonHighlight) }
    public static var ctaButtonDisabled: Color { satsColor(for: .ctaButtonDisabled) }

    public static var action: Color { satsColor(for: .action) }
    public static var actionHighlight: Color { satsColor(for: .actionHighlight) }
    public static var actionDisabled: Color { satsColor(for: .actionDisabled) }

    public static var waitingListButton: Color { satsColor(for: .waitingListButton) }
    public static var waitingListButtonHighlight: Color { satsColor(for: .waitingListButtonHighlight) }
    public static var waitingListButtonDisabled: Color { satsColor(for: .waitingListButtonDisabled) }

    public static var deleteButton: Color { satsColor(for: .deleteButton) }
    public static var deleteButtonHighlight: Color { satsColor(for: .deleteButtonHighlight) }
    public static var deleteButtonDisabled: Color { satsColor(for: .deleteButtonDisabled) }

    // MARK: - Graphical Elements

    // MARK: Divider

    public static var divider: Color { satsColor(for: .divider) }
    public static var dividerAlternate: Color { satsColor(for: .dividerAlternate) }

    // MARK: Skeleton

    public static var skeleton: Color { satsColor(for: .skeleton) }

    // MARK: Nav Bar

    public static var navBarSelected: Color { satsColor(for: .navBarSelected) }
    public static var navBarNotSelected: Color { satsColor(for: .navBarNotSelected) }

    // MARK: Progress Bar

    public static var progressBarIndicator: Color { satsColor(for: .progressBarIndicator) }
    public static var progressBarBackground: Color { satsColor(for: .progressBarBackground) }

    // MARK: Graphs

    public static var graphBarPrimary: Color { satsColor(for: .graphBarPrimary) }
    public static var graphBarSecondary: Color { satsColor(for: .graphBarSecondary) }
    public static var graphBackgroundPrimary: Color { satsColor(for: .graphBackgroundPrimary) }
    public static var graphBackgroundSecondary: Color { satsColor(for: .graphBackgroundSecondary) }
    public static var graphUpwardsTrend: Color { satsColor(for: .graphUpwardsTrend) }
    public static var graphNeutralTrend: Color { satsColor(for: .graphNeutralTrend) }
    public static var graphDownwardsTrend: Color { satsColor(for: .graphDownwardsTrend) }

    // MARK: Selector

    public static var selectorUnselected: Color { satsColor(for: .selectorUnselected) }
    public static var selectorUnselectedDisabled: Color { satsColor(for: .selectorUnselectedDisabled) }

    public static var selectorSelected: Color { satsColor(for: .selectorSelected) }
    public static var selectorSelectedDisabled: Color { satsColor(for: .selectorSelectedDisabled) }

    // MARK: Toggle

    public static var toggleUnselected: Color { satsColor(for: .toggleUnselected) }
    public static var toggleUnselectedDisabled: Color { satsColor(for: .toggleUnselectedDisabled) }
    public static var toggleInteractiveElement: Color { satsColor(for: .toggleInteractiveElement) }
    public static var toggleSelected: Color { satsColor(for: .toggleSelected) }
    public static var toggleSelectedDisabled: Color { satsColor(for: .toggleSelectedDisabled) }

    // MARK: Icons

    public static var iconPrimary: Color { satsColor(for: .iconPrimary) }
    public static var iconSecondary: Color { satsColor(for: .iconSecondary) }
    public static var iconFixed: Color { satsColor(for: .iconFixed) }
    public static var iconPositive: Color { satsColor(for: .iconPositive) }
    public static var iconAttention: Color { satsColor(for: .iconAttention) }
    public static var iconNegative: Color { satsColor(for: .iconNegative) }
    public static var iconWaitingList: Color { satsColor(for: .iconWaitingList) }
    public static var iconDelete: Color { satsColor(for: .iconDelete) }

    // MARK: Indicators

    public static var indicatorPositive: Color { satsColor(for: .indicatorPositive) }
    public static var indicatorPositiveAlternate: Color { satsColor(for: .indicatorPositiveAlternate) }

    public static var indicatorAttention: Color { satsColor(for: .indicatorAttention) }
    public static var indicatorAttentionAlternate: Color { satsColor(for: .indicatorAttentionAlternate) }

    public static var indicatorNegative: Color { satsColor(for: .indicatorNegative) }
    public static var indicatorNegativeAlternate: Color { satsColor(for: .indicatorNegativeAlternate) }

    public static var indicatorNeutralList: Color { satsColor(for: .indicatorNeutralList) }
    public static var indicatorNeutralListAlternate: Color { satsColor(for: .indicatorNeutralListAlternate) }

    // MARK: Signal

    public static var signalSuccess: Color { satsColor(for: .signalSuccess) }
    public static var signalWarning: Color { satsColor(for: .signalWarning) }
    public static var signalError: Color { satsColor(for: .signalError) }
    public static var signalNeutral: Color { satsColor(for: .signalNeutral) }
    public static var signalWaitingList: Color { satsColor(for: .signalWaitingList) }

    // MARK: Tags

    public static var tagPrimary: Color { satsColor(for: .tagPrimary) }
    public static var tagSecondary: Color { satsColor(for: .tagSecondary) }
    public static var tagFeatured: Color { satsColor(for: .tagFeatured) }

    // MARK: Rewards

    public static var rewardsBlue: Color { satsColor(for: .rewardsBlue) }
    public static var rewardsSilver: Color { satsColor(for: .rewardsSilver) }
    public static var rewardsGold: Color { satsColor(for: .rewardsGold) }
    public static var rewardsPlatinum: Color { satsColor(for: .rewardsPlatinum) }

    // MARK: Workouts

    public static var workoutPt: Color { satsColor(for: .workoutPt) }
    public static var workoutGx: Color { satsColor(for: .workoutGx) }
    public static var workoutTreatments: Color { satsColor(for: .workoutTreatments) }
    public static var workoutGymfloor: Color { satsColor(for: .workoutGymfloor) }
    public static var workoutOwnTraining: Color { satsColor(for: .workoutOwnTraining) }

    // MARK: - Backgrounds and Surfaces

    // MARK: Background

    public static var backgroundPrimary: Color { satsColor(for: .backgroundPrimary) }
    public static var backgroundSecondary: Color { satsColor(for: .backgroundSecondary) }
    public static var backgroundFixed: Color { satsColor(for: .backgroundFixed) }

    // MARK: Surface

    public static var surfacePrimary: Color { satsColor(for: .surfacePrimary) }
    public static var surfaceSecondary: Color { satsColor(for: .surfaceSecondary) }
    public static var surfaceFixed: Color { satsColor(for: .surfaceFixed) }

    // MARK: Signal Surface

    public static var signalSurfaceSuccess: Color { satsColor(for: .signalSurfaceSuccess) }
    public static var signalSurfaceWarning: Color { satsColor(for: .signalSurfaceWarning) }
    public static var signalSurfaceError: Color { satsColor(for: .signalSurfaceError) }
    public static var signalSurfaceWaitingList: Color { satsColor(for: .signalSurfaceWaitingList) }
    public static var signalSurfaceNeutral: Color { satsColor(for: .signalSurfaceNeutral) }

    // MARK: - "On" Colors

    // MARK: On Buttons

    public static var onPrimaryButton: Color { satsColor(for: .onPrimaryButton) }
    public static var onPrimaryButtonDisabled: Color { satsColor(for: .onPrimaryButtonDisabled) }

    public static var onSecondaryButton: Color { satsColor(for: .onSecondaryButton) }
    public static var onSecondaryButtonDisabled: Color { satsColor(for: .onSecondaryButtonDisabled) }

    public static var onCleanButton: Color { satsColor(for: .onCleanButton) }
    public static var onCleanButtonDisabled: Color { satsColor(for: .onCleanButtonDisabled) }

    public static var onCleanSecondaryButton: Color { satsColor(for: .onCleanSecondaryButton) }
    public static var onCleanSecondaryButtonDisabled: Color { satsColor(for: .onCleanSecondaryButtonDisabled) }

    public static var onCtaButton: Color { satsColor(for: .onCtaButton) }
    public static var onCtaButtonDisabled: Color { satsColor(for: .onCtaButtonDisabled) }

    public static var onWaitingListButton: Color { satsColor(for: .onWaitingListButton) }
    public static var onWaitingListButtonDisabled: Color { satsColor(for: .onWaitingListButtonDisabled) }

    public static var onDeleteButton: Color { satsColor(for: .onDeleteButton) }
    public static var onDeleteButtonDisabled: Color { satsColor(for: .onDeleteButtonDisabled) }

    // MARK: On Tags

    public static var onTagPrimary: Color { satsColor(for: .onTagPrimary) }
    public static var onTagSecondary: Color { satsColor(for: .onTagSecondary) }
    public static var onTagFeatured: Color { satsColor(for: .onTagFeatured) }

    // MARK: On Rewards

    public static var onReward: Color { satsColor(for: .onReward) }

    // MARK: On Background

    public static var onBackgroundPrimary: Color { satsColor(for: .onBackgroundPrimary) }
    public static var onBackgroundPrimaryAlternate: Color { satsColor(for: .onBackgroundPrimaryAlternate) }
    public static var onBackgroundPrimaryDisabled: Color { satsColor(for: .onBackgroundPrimaryDisabled) }

    public static var onBackgroundSecondary: Color { satsColor(for: .onBackgroundSecondary) }
    public static var onBackgroundSecondaryAlternate: Color { satsColor(for: .onBackgroundSecondaryAlternate) }
    public static var onBackgroundSecondaryDisabled: Color { satsColor(for: .onBackgroundSecondaryDisabled) }

    public static var onBackgroundTertiary: Color { satsColor(for: .onBackgroundTertiary) }
    public static var onBackgroundTertiaryAlternate: Color { satsColor(for: .onBackgroundTertiaryAlternate) }
    public static var onBackgroundTertiaryDisabled: Color { satsColor(for: .onBackgroundTertiaryDisabled) }

    // MARK: On Surface

    public static var onSurfacePrimary: Color { satsColor(for: .onSurfacePrimary) }
    public static var onSurfacePrimaryAlternate: Color { satsColor(for: .onSurfacePrimaryAlternate) }
    public static var onSurfacePrimaryDisabled: Color { satsColor(for: .onSurfacePrimaryDisabled) }
    public static var onSurfacePrimarySelected: Color { satsColor(for: .onSurfacePrimarySelected) }

    public static var onSurfaceSecondary: Color { satsColor(for: .onSurfaceSecondary) }
    public static var onSurfaceSecondaryAlternate: Color { satsColor(for: .onSurfaceSecondaryAlternate) }
    public static var onSurfaceSecondaryDisabled: Color { satsColor(for: .onSurfaceSecondaryDisabled) }

    public static var onSurfaceFixed: Color { satsColor(for: .onSurfaceFixed) }
    public static var onSurfaceFixedAlternate: Color { satsColor(for: .onSurfaceFixedAlternate) }
    public static var onSurfaceFixedDisabled: Color { satsColor(for: .onSurfaceFixedDisabled) }

    public static var onSurfaceSuccess: Color { satsColor(for: .onSurfaceSuccess) }
    public static var onSurfaceWarning: Color { satsColor(for: .onSurfaceWarning) }
    public static var onSurfaceError: Color { satsColor(for: .onSurfaceError) }
    public static var onSurfaceWaitingList: Color { satsColor(for: .onSurfaceWaitingList) }
    public static var onSurfaceNeutral: Color { satsColor(for: .onSurfaceNeutral) }

    // MARK: On Signal Surface

    public static var onSignalSurfaceSuccess: Color { satsColor(for: .onSignalSurfaceSuccess) }
    public static var onSignalSurfaceSuccessAlternate: Color { satsColor(for: .onSignalSurfaceSuccessAlternate) }

    public static var onSignalSurfaceWarning: Color { satsColor(for: .onSignalSurfaceWarning) }
    public static var onSignalSurfaceWarningAlternate: Color { satsColor(for: .onSignalSurfaceWarningAlternate) }

    public static var onSignalSurfaceError: Color { satsColor(for: .onSignalSurfaceError) }
    public static var onSignalSurfaceErrorAlternate: Color { satsColor(for: .onSignalSurfaceErrorAlternate) }

    public static var onSignalSurfaceWaitingList: Color { satsColor(for: .onSignalSurfaceWaitingList) }
    public static var onSignalSurfaceWaitingListAlternate: Color { satsColor(for: .onSignalSurfaceWaitingListAlternate) }

    public static var onSignalSurfaceNeutral: Color { satsColor(for: .onSignalSurfaceNeutral) }
    public static var onSignalSurfaceNeutralAlternate: Color { satsColor(for: .onSignalSurfaceNeutralAlternate) }
}
// swiftlint:enable line_length

private extension Color {
    static func satsColor(for colorName: SATSColorName) -> Color {
        SATSColor.definition(for: colorName).color
    }
}
