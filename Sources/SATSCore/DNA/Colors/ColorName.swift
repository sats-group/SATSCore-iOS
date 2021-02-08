import Foundation

enum ColorName: String, CaseIterable {
    case backgroundPrimary
    case backgroundSecondary
    case backgroundShimmer
    case backgroundTabbar
    case backgroundSurfaceStart
    case backgroundSurfaceEnd

    case buttonPrimary
    case buttonPrimaryHighlight
    case buttonPrimaryDisabled

    case buttonSecondary
    case buttonSecondaryHighlight
    case buttonSecondaryDisabled

    case buttonCta
    case buttonCtaHighlight
    case buttonCtaDisabled

    case onButtonPrimary
    case onButtonPrimarySecondary

    case onButtonSecondary
    case onButtonSecondarySecondary

    case onButtonCta
    case onButtonCtaSecondary

    case onBackgroundSurface
    case onBackgroundSurfaceSecondary

    case onBackgroundPrimary
    case onBackgroundPrimarySecondary

    case waitlist
    case waitlistHighlight

    case link
    case linkHighlight

    case signalSuccess
    case signalWarning
    case signalDelete
    case signalError

    case border
}
