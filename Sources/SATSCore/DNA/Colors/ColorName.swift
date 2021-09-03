import Foundation

/// Static list of color names defined in the Assets folder to avoid misspelling them
enum ColorName: String, CaseIterable {
    case backgroundPrimary
    case backgroundSecondary
    case backgroundSurface

    case secondary
    case secondaryHighlight
    case secondaryDisabled
    case clean

    case cta
    case ctaHighlight
    case ctaDisabled
    case nonText

    case waitlist
    case waitlistHighlight

    case signalSuccess
    case signalWarning
    case signalDelete
    case signalError

    case border
    case shimmer
    case tabs
    case graphicalElements1
    case graphicalElements2
    case graphicalElements3

    // "On" colors

    case onPrimary
    case onPrimaryDisabled

    case onSecondary
    case onSecondaryDisabled

    case onClean
    case onCleanDisabled

    case onCta
    case onCtaDisabled

    case onNonText
    case onSignal
    case onWaitlist

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

    case onGradientPrimary
    case onGradientSecondary
    case onGradientDisabled

    // Theme colors

    case primary
    case primaryHighlight
    case primaryDisabled

    case selection

    case backgroundTopStart
    case backgroundTopEnd

    case navigationPrimary
    case navigationSecondary
}
