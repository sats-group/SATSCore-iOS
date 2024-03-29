import UIKit

#if os(iOS)
public extension UIColor {
    static var primary: UIColor { color(.primary) }
    static var primaryHighlight: UIColor { color(.primaryHighlight) }
    static var primaryDisabled: UIColor { color(.primaryDisabled) }

    // MARK: Background

    static var backgroundPrimary: UIColor { color(.backgroundPrimary) }
    static var backgroundSecondary: UIColor { color(.backgroundSecondary) }
    static var backgroundSurfacePrimary: UIColor { color(.backgroundSurfacePrimary) }
    static var backgroundSurfaceSecondary: UIColor { color(.backgroundSurfaceSecondary) }

    // MARK: Secondary

    static var secondary: UIColor { color(.secondary) }
    static var secondaryHighlight: UIColor { color(.secondaryHighlight) }
    static var secondaryDisabled: UIColor { color(.secondaryDisabled) }

    // MARK: Clean

    static var clean: UIColor { color(.clean) }
    static var cleanHighlight: UIColor { color(.cleanHighlight) }
    static var cleanDisabled: UIColor { color(.cleanDisabled) }

    // MARK: Clean Secondary

    static var cleanSecondary: UIColor { color(.cleanSecondary) }
    static var cleanSecondaryHighlight: UIColor { color(.cleanSecondaryHighlight) }
    static var cleanSecondaryDisabled: UIColor { color(.cleanSecondaryDisabled) }

    // MARK: CTA

    static var cta: UIColor { color(.cta) }
    static var ctaHighlight: UIColor { color(.ctaHighlight) }
    static var ctaDisabled: UIColor { color(.ctaDisabled) }
    static var nonText: UIColor { color(.nonText) }

    // MARK: Action

    static var action: UIColor { color(.action) }
    static var actionHighlight: UIColor { color(.actionHighlight) }
    static var actionDisabled: UIColor { color(.actionDisabled) }

    // MARK: Waitlist

    static var waitlist: UIColor { color(.waitlist) }
    static var waitlistHighlight: UIColor { color(.waitlistHighlight) }
    static var waitlistDisabled: UIColor { color(.waitlistDisabled) }
    static var waitlistText: UIColor { color(.waitlistText) }
    static var waitlistBackground: UIColor { color(.waitlistBackground) }

    // MARK: Signal

    static var signalSuccess: UIColor { color(.signalSuccess) }
    static var signalWarning: UIColor { color(.signalWarning) }
    static var signalDelete: UIColor { color(.signalDelete) }
    static var signalError: UIColor { color(.signalError) }

    // MARK: SignalText

    static var signalSuccessText: UIColor { color(.signalSuccessText) }
    static var signalWarningText: UIColor { color(.signalWarningText) }
    static var signalDeleteText: UIColor { color(.signalDeleteText) }
    static var signalErrorText: UIColor { color(.signalErrorText) }

    // MARK: SignalBackground

    static var signalSuccessBackground: UIColor { color(.signalSuccessBackground) }
    static var signalWarningBackground: UIColor { color(.signalWarningBackground) }
    static var signalDeleteBackground: UIColor { color(.signalDeleteBackground) }
    static var signalErrorBackground: UIColor { color(.signalErrorBackground) }

    // MARK: UI

    static var border: UIColor { color(.border) }
    static var graphicalElements1: UIColor { color(.graphicalElements1) }
    static var graphicalElements2: UIColor { color(.graphicalElements2) }
    static var graphicalElements3: UIColor { color(.graphicalElements3) }
    static var graphicalElements4: UIColor { color(.graphicalElements4) }
    static var graphicalElements5: UIColor { color(.graphicalElements5) }
    static var graphicalElements6: UIColor { color(.graphicalElements6) }
    static var graphicalElements7: UIColor { color(.graphicalElements7) }
    static var shimmer: UIColor { color(.shimmer) }
    static var tabs: UIColor { color(.tabs) }
    static var navigation: UIColor { color(.navigation) }

    // MARK: "On" colors

    // used in text and icons "on" top of another color

    static var onPrimary: UIColor { color(.onPrimary) }
    static var onPrimaryDisabled: UIColor { color(.onPrimaryDisabled) }

    static var onSecondary: UIColor { color(.onSecondary) }
    static var onSecondaryDisabled: UIColor { color(.onSecondaryDisabled) }

    static var onClean: UIColor { color(.onClean) }
    static var onCleanDisabled: UIColor { color(.onCleanDisabled) }

    static var onCleanSecondary: UIColor { color(.onCleanSecondary) }
    static var onCleanSecondaryDisabled: UIColor { color(.onCleanSecondaryDisabled) }

    static var onCta: UIColor { color(.onCta) }
    static var onCtaDisabled: UIColor { color(.onCtaDisabled) }

    static var onNonText: UIColor { color(.onNonText) }
    static var onSignal: UIColor { color(.onSignal) }
    static var onRewards: UIColor { color(.onRewards) }
    static var onWaitlist: UIColor { color(.onWaitlist) }
    static var onWaitlistDisabled: UIColor { color(.onWaitlistDisabled) }

    static var onBackgroundEnabledOn: UIColor { color(.onBackgroundEnabledOn) }
    static var onBackgroundEnabledOff: UIColor { color(.onBackgroundEnabledOff) }
    static var onBackgroundDisabledOn: UIColor { color(.onBackgroundDisabledOn) }
    static var onBackgroundDisabledOff: UIColor { color(.onBackgroundDisabledOff) }
    static var onBackgroundPrimary: UIColor { color(.onBackgroundPrimary) }
    static var onBackgroundSecondary: UIColor { color(.onBackgroundSecondary) }
    static var onBackgroundDisabled: UIColor { color(.onBackgroundDisabled) }

    static var onSurfaceEnabledOn: UIColor { color(.onSurfaceEnabledOn) }
    static var onSurfaceEnabledOff: UIColor { color(.onSurfaceEnabledOff) }
    static var onSurfaceDisabledOn: UIColor { color(.onSurfaceDisabledOn) }
    static var onSurfaceDisabledOff: UIColor { color(.onSurfaceDisabledOff) }
    static var onSurfacePrimary: UIColor { color(.onSurfacePrimary) }
    static var onSurfaceSecondary: UIColor { color(.onSurfaceSecondary) }
    static var onSurfaceDisabled: UIColor { color(.onSurfaceDisabled) }

    // MARK: Challenge colors

    static var challengeFailed: UIColor { color(.challengeFailed) }
    static var challengeInProgress: UIColor { color(.challengeInProgress) }
    static var challengeNotDone: UIColor { color(.challengeNotDone) }
    static var challengeSuccess: UIColor { color(.challengeSuccess) }

    // MARK: Workouts

    static var workoutPt: UIColor { color(.workoutPt) }
    static var workoutGx: UIColor { color(.workoutGx) }
    static var workoutGymfloor: UIColor { color(.workoutGymfloor) }
    static var workoutOwnTraining: UIColor { color(.workoutOwnTraining) }

    // MARK: Rewards

    static var rewardsBlue: UIColor { color(.rewardsBlue) }
    static var rewardsSilver: UIColor { color(.rewardsSilver) }
    static var rewardsGold: UIColor { color(.rewardsGold) }
    static var rewardsPlatinum: UIColor { color(.rewardsPlatinum) }

    // MARK: Private

    private static func color(_ name: ColorName) -> UIColor {
        guard let color = UIColor(named: name.rawValue, in: .module, compatibleWith: nil) else {
            preconditionFailure("❌ \(name.rawValue) color not found!")
        }

        return color
    }
}
#endif
