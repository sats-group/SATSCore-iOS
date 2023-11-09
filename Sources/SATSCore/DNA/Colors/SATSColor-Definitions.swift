import SwiftUI

struct SATSColor {}

extension SATSColor {
    static let definitions: [SATSColorName: SemanticColorDefinition] = [
        // MARK: - Buttons

        .primaryButton: .init(light: .satsBlue100, dark: .brightBlue110),
        .primaryButtonHighlight: .init(light: .satsBlueGrey80, dark: .brightBlue100),
        .primaryButtonDisabled: .init(light: .black20, dark: .brightBlue160),

        .secondaryButton: .init(light: .satsBlue100, dark: .brightBlue110),
        .secondaryButtonHighlight: .init(light: .satsLightGray15, dark: .black60),
        .secondaryButtonDisabled: .init(light: .black20, dark: .black80),

        .cleanButton: .init(light: .white100, dark: .white100),
        .cleanButtonHighlight: .init(light: .satsBlue5, dark: .white90),
        .cleanButtonDisabled: .init(light: .white20, dark: .white10),

        .cleanSecondaryButton: .init(light: .white15, dark: .white15),
        .cleanSecondaryButtonHighlight: .init(light: .white10, dark: .white10),
        .cleanSecondaryButtonDisabled: .init(light: .white5, dark: .white5),

        .ctaButton: .init(light: .satsCoral120, dark: .satsCoral100),
        .ctaButtonHighlight: .init(light: .satsCoral130, dark: .satsCoral120),
        .ctaButtonDisabled: .init(light: .black20, dark: .black80),

        .action: .init(light: .satsCoral120, dark: .satsCoral100),
        .actionHighlight: .init(light: .satsCoral130, dark: .satsCoral90),
        .actionDisabled: .init(light: .black20, dark: .black50),

        .waitingListButton: .init(light: .egyptianPurple80, dark: .egyptianPurple80),
        .waitingListButtonHighlight: .init(light: .egyptianPurple100, dark: .egyptianPurple100),
        .waitingListButtonDisabled: .init(light: .black20, dark: .black80),

        .deleteButton: .init(light: .chiliRed100, dark: .chiliRed100),
        .deleteButtonHighlight: .init(light: .chiliRed120, dark: .chiliRed80),
        .deleteButtonDisabled: .init(light: .black20, dark: .black80),

        // MARK: - Graphical Elements

        // MARK: Divider

        .divider: .init(light: .satsLightGray15, dark: .black80),
        .dividerAlternate: .init(light: .blackO20, dark: .white40),

        // MARK: Skeleton

        .skeleton: .init(light: .satsLightGray15, dark: .black80),

        // MARK: Nav Bar

        .navBarSelected: .init(light: .satsCoral100, dark: .satsCoral90),
        .navBarNotSelected: .init(light: .satsBlue100, dark: .white100),

        // MARK: Progress Bar

        .progressBarIndicator: .init(light: .satsCoral100, dark: .satsCoral90),
        .progressBarBackground: .init(light: .satsLightGray15, dark: .black70),

        // MARK: Graphs

        .graphBarPrimary: .init(light: .satsCoral100, dark: .satsCoral90),
        .graphBarSecondary: .init(light: .satsBlue40, dark: .satsBlue40),
        .graphBackgroundPrimary: .init(light: .satsLightGray15, dark: .black80),
        .graphBackgroundSecondary: .init(light: .satsBlue5, dark: .black70),
        .graphUpwardsTrend: .init(light: .springGreen80, dark: .springGreen80),
        .graphNeutralTrend: .init(light: .satsCoral40, dark: .satsCoral130),
        .graphDownwardsTrend: .init(light: .cardinal100, dark: .cardinal100),

        // MARK: Selector

        .selectorUnselected: .init(light: .satsCoral100, dark: .white100),
        .selectorUnselectedDisabled: .init(light: .satsLightGray15, dark: .white10),

        .selectorSelected: .init(light: .satsCoral100, dark: .satsCoral90),
        .selectorSelectedDisabled: .init(light: .satsLightGray15, dark: .satsCoral130),

        // MARK: Toggle

        .toggleUnselected: .init(light: .satsBlue40, dark: .black70),
        .toggleUnselectedDisabled: .init(light: .satsLightGray15, dark: .black80),
        .toggleInteractiveElement: .init(light: .white100, dark: .white100),
        .toggleSelected: .init(light: .satsCoral100, dark: .satsCoral90),
        .toggleSelectedDisabled: .init(light: .satsCoral40, dark: .satsCoral130),

        // MARK: Icons

        .iconPrimary: .init(light: .satsBlue100, dark: .white100),
        .iconSecondary: .init(light: .satsBlueGrey80, dark: .black20),
        .iconFixed: .init(light: .white100, dark: .white100),
        .iconPositive: .init(light: .springGreen100, dark: .springGreen80),
        .iconAttention: .init(light: .gold100, dark: .gold100),
        .iconNegative: .init(light: .cardinal100, dark: .cardinal100),
        .iconWaitingList: .init(light: .egyptianPurple100, dark: .egyptianPurple80),
        .iconDelete: .init(light: .chiliRed100, dark: .chiliRed80),

        // MARK: Indicators

        .indicatorPositive: .init(light: .springGreen100, dark: .springGreen80),
        .indicatorPositiveAlternate: .init(light: .springGreen30, dark: .springGreen170),

        .indicatorAttention: .init(light: .gold100, dark: .gold100),
        .indicatorAttentionAlternate: .init(light: .gold30, dark: .gold170),

        .indicatorNegative: .init(light: .cardinal100, dark: .cardinal100),
        .indicatorNegativeAlternate: .init(light: .cardinal30, dark: .cardinal170),

        .indicatorNeutralList: .init(light: .satsBlue70, dark: .satsBlue40),
        .indicatorNeutralListAlternate: .init(light: .satsBlue40, dark: .black80),

        // MARK: Signal

        .signalSuccess: .init(light: .springGreen100, dark: .springGreen80),
        .signalWarning: .init(light: .gold100, dark: .gold100),
        .signalError: .init(light: .cardinal100, dark: .cardinal100),
        .signalNeutral: .init(light: .satsBlue70, dark: .satsBlue40),
        .signalWaitingList: .init(light: .egyptianPurple100, dark: .egyptianPurple80),

        // MARK: Tags

        .tagPrimary: .init(light: .satsBlue100, dark: .brightBlue110),
        .tagSecondary: .init(light: .satsBlue5, dark: .black80),
        .tagFeatured: .init(light: .satsCoral100, dark: .satsCoral90),

        // MARK: Rewards

        .rewardsBlue: .init(light: .satsBlue100, dark: .brightBlue100),
        .rewardsSilver: .init(light: .black50, dark: .satsBlue20),
        .rewardsGold: .init(light: .gold130, dark: .gold110),
        .rewardsPlatinum: .init(light: .satsBlueGrey80, dark: .satsBlue40),

        // MARK: Workouts

        .workoutPt: .init(light: .uranianBlue100, dark: .uranianBlue70),
        .workoutGx: .init(light: .salmonPink100, dark: .salmonPink70),
        .workoutTreatments: .init(light: .caribbeanCurrent100, dark: .caribbeanCurrent70),
        .workoutGymfloor: .init(light: .tangerine100, dark: .tangerine70),
        .workoutOwnTraining: .init(light: .celadon100, dark: .celadon70),

        // MARK: - Backgrounds and Surfaces

        // MARK: Background

        .backgroundPrimary: .init(light: .black3, dark: .black100),
        .backgroundSecondary: .init(light: .white100, dark: .black90),
        .backgroundFixed: .init(light: .satsBlue100, dark: .satsBlue100),

        // MARK: Surface

        .surfacePrimary: .init(light: .white100, dark: .black85),
        .surfaceSecondary: .init(light: .black5, dark: .black90),
        .surfaceFixed: .init(light: .satsBlueGrey80, dark: .satsBlueGrey80),

        // MARK: Signal Surface

        .signalSurfaceSuccess: .init(light: .springGreen10, dark: .springGreen170),
        .signalSurfaceWarning: .init(light: .gold10, dark: .gold170),
        .signalSurfaceError: .init(light: .cardinal10, dark: .cardinal170),
        .signalSurfaceWaitingList: .init(light: .egyptianPurple10, dark: .egyptianPurple160),
        .signalSurfaceNeutral: .init(light: .black5, dark: .black90),

        // MARK: - "On" Colors

        // MARK: On Buttons

        .onPrimaryButton: .init(light: .white100, dark: .white100),
        .onPrimaryButtonDisabled: .init(light: .black60, dark: .black50),

        .onSecondaryButton: .init(light: .satsBlue100, dark: .white100),
        .onSecondaryButtonDisabled: .init(light: .black60, dark: .black50),

        .onCleanButton: .init(light: .satsBlue100, dark: .satsBlue100),
        .onCleanButtonDisabled: .init(light: .black60, dark: .black50),

        .onCleanSecondaryButton: .init(light: .white100, dark: .white100),
        .onCleanSecondaryButtonDisabled: .init(light: .white60, dark: .white70),

        .onCtaButton: .init(light: .white100, dark: .white100),
        .onCtaButtonDisabled: .init(light: .white60, dark: .white70),

        .onWaitingListButton: .init(light: .white100, dark: .white100),
        .onWaitingListButtonDisabled: .init(light: .white60, dark: .black50),

        .onDeleteButton: .init(light: .white100, dark: .white100),
        .onDeleteButtonDisabled: .init(light: .white60, dark: .black50),

        // MARK: On Tags

        .onTagPrimary: .init(light: .white100, dark: .white100),
        .onTagSecondary: .init(light: .satsBlue100, dark: .white100),
        .onTagFeatured: .init(light: .white100, dark: .satsBlue100),

        // MARK: On Rewards

        .onReward: .init(light: .white100, dark: .satsBlue100),

        // MARK: On Background

        .onBackgroundPrimary: .init(light: .satsBlue100, dark: .white100),
        .onBackgroundPrimaryAlternate: .init(light: .satsBlueGrey80, dark: .black20),
        .onBackgroundPrimaryDisabled: .init(light: .black60, dark: .black50),

        .onBackgroundSecondary: .init(light: .satsBlue100, dark: .white100),
        .onBackgroundSecondaryAlternate: .init(light: .satsBlueGrey80, dark: .black20),
        .onBackgroundSecondaryDisabled: .init(light: .black60, dark: .black50),

        .onBackgroundTertiary: .init(light: .white100, dark: .white100),
        .onBackgroundTertiaryAlternate: .init(light: .white80, dark: .white80),
        .onBackgroundTertiaryDisabled: .init(light: .white60, dark: .white50),

        // MARK: On Surface

        .onSurfacePrimary: .init(light: .satsBlue100, dark: .white100),
        .onSurfacePrimaryAlternate: .init(light: .satsBlueGrey80, dark: .black20),
        .onSurfacePrimaryDisabled: .init(light: .black60, dark: .black50),
        .onSurfacePrimarySelected: .init(light: .satsCoral120, dark: .satsCoral40),

        .onSurfaceSecondary: .init(light: .satsBlue100, dark: .white100),
        .onSurfaceSecondaryAlternate: .init(light: .satsBlueGrey80, dark: .black20),
        .onSurfaceSecondaryDisabled: .init(light: .black60, dark: .black50),

        .onSurfaceFixed: .init(light: .white100, dark: .white100),
        .onSurfaceFixedAlternate: .init(light: .white85, dark: .white80),
        .onSurfaceFixedDisabled: .init(light: .white65, dark: .white50),

        .onSurfaceSuccess: .init(light: .springGreen120, dark: .springGreen80),
        .onSurfaceWarning: .init(light: .gold140, dark: .gold80),
        .onSurfaceError: .init(light: .cardinal120, dark: .cardinal60),
        .onSurfaceWaitingList: .init(light: .egyptianPurple100, dark: .egyptianPurple60),
        .onSurfaceNeutral: .init(light: .black60, dark: .black40),

        // MARK: On Signal Surface

        .onSignalSurfaceSuccess: .init(light: .satsBlue100, dark: .white100),
        .onSignalSurfaceSuccessAlternate: .init(light: .springGreen120, dark: .springGreen80),

        .onSignalSurfaceWarning: .init(light: .satsBlue100, dark: .white100),
        .onSignalSurfaceWarningAlternate: .init(light: .gold140, dark: .gold80),

        .onSignalSurfaceError: .init(light: .satsBlue100, dark: .white100),
        .onSignalSurfaceErrorAlternate: .init(light: .cardinal120, dark: .cardinal60),

        .onSignalSurfaceWaitingList: .init(light: .satsBlue100, dark: .white100),
        .onSignalSurfaceWaitingListAlternate: .init(light: .egyptianPurple100, dark: .egyptianPurple60),

        .onSignalSurfaceNeutral: .init(light: .satsBlue100, dark: .white100),
        .onSignalSurfaceNeutralAlternate: .init(light: .black60, dark: .black40),
    ]
}

extension SATSColor {
    static func definition(for colorName: SATSColorName) -> SemanticColorDefinition {
        guard let definition = SATSColor.definitions[colorName] else {
            fatalError("❌ no color definition for \(colorName) found")
        }

        return definition
    }
}
