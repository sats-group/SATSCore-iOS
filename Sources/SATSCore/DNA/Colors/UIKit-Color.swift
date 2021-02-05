import UIKit

public extension UIColor {

    // MARK: Background

    static var backgroundPrimary: UIColor { color(named: "backgroundPrimary") }
    static var backgroundSecondary: UIColor { color(named: "backgroundSecondary") }
    static var backgroundShimmer: UIColor { color(named: "backgroundShimmer") }
    static var backgroundTabbar: UIColor { color(named: "backgroundTabbar") }
    static var backgroundSurfaceStart: UIColor { color(named: "backgroundSurfaceStart") }
    static var backgroundSurfaceEnd: UIColor { color(named: "backgroundSurfaceEnd") }

    // MARK: Button

    static var buttonPrimary: UIColor { color(named: "buttonPrimary") }
    static var buttonPrimaryHighlight: UIColor { color(named: "buttonPrimaryHighlight") }
    static var buttonPrimaryDisabled: UIColor { color(named: "buttonPrimaryDisabled") }

    static var buttonSecondary: UIColor { color(named: "buttonSecondary") }
    static var buttonSecondaryHighlight: UIColor { color(named: "buttonSecondaryHighlight") }
    static var buttonSecondaryDisabled: UIColor { color(named: "buttonSecondaryDisabled") }

    static var buttonCta: UIColor { color(named: "buttonCta") }
    static var buttonCtaHighlight: UIColor { color(named: "buttonCtaHighlight") }
    static var buttonCtaDisabled: UIColor { color(named: "buttonCtaDisabled") }

    // MARK: "On" colors
    // "On" colors are used for text and icons, they are related on where this text/icon
    // is presented "on top of", like a backgroundPrimary, etc.

    static var onButtonPrimary: UIColor { color(named: "onButtonPrimary")}
    static var onButtonPrimarySecondary: UIColor { color(named: "onButtonPrimarySecondary")}

    static var onButtonSecondary: UIColor { color(named: "onButtonSecondary")}
    static var onButtonSecondarySecondary: UIColor { color(named: "onButtonSecondarySecondary")}

    static var onButtonCta: UIColor { color(named: "onButtonCta")}
    static var onButtonCtaSecondary: UIColor { color(named: "onButtonCtaSecondary")}

    static var onBackgroundSurface: UIColor { color(named: "onBackgroundSurface")}
    static var onBackgroundSurfaceSecondary: UIColor { color(named: "onBackgroundSurfaceSecondary")}

    static var onBackgroundPrimary: UIColor { color(named: "onBackgroundPrimary")}
    static var onBackgroundPrimarySecondary: UIColor { color(named: "onBackgroundPrimarySecondary")}

    // MARK: Waitlist

    static var waitlist: UIColor { color(named: "waitlist") }

    // MARK: Link

    static var link: UIColor { color(named: "link") }

    // MARK: Signal

    static var signalSuccess: UIColor { color(named: "signalSuccess") }
    static var signalWarning: UIColor { color(named: "signalWarning") }
    static var signalDelete: UIColor { color(named: "signalDelete") }
    static var signalError: UIColor { color(named: "signalError") }

    // MARK: Other UI

    static var border: UIColor { color(named: "border") }

    // MARK: Private

    private static func color(named: String) -> UIColor {
        guard let color = UIColor(named: named, in: .module, compatibleWith: nil) else {
            preconditionFailure("❌ \(named) color not found!")
        }

        return color
    }
}


/*

 .background or .bg

 .button or .btn

 --------




 Button Primary ⭐️ 🎨
 Button Secondary ⭐️
 Button CTA ⭐️

 Waitlist
 Link
 Signal

 Background Primary ⭐️
 Background Secondary ⭐️
 Background Surface ⭐️
 Background Top 🎨

 Gradient Start ⭐️ 🎨
 Gradient End ⭐️ 🎨

 Selection 🎨

 Border
 Tabbar
 Shimmer

 ---

 🎨 = Theme dependant
 ⭐️ = has an "on" color

 ---

 ## On "Colors", take 2

 textPrimary
 textSecondary
 textDisabled

 iconPrimary
 iconSecondary
 iconDisabled

 -

 onButtonPrimary
 onButtonPrimarySecondary

 onButtonSecondary
 onButtonSecondarySecondary

 onButtonCta
 onButtonCtaSecondary

 onBackgroundSurface
 onBackgroundSurfaceSecondary

 onBackgroundPrimary
 onBackgroundPrimarySecondary

 onGradientPrimary
 onGradientSecondary
 onGradientDisabled




 -----


 - simple colors
 - "on" colors
 - themed colors
 - demo

 - button















 --------

 ### Color names UIColor

 buttonPrimary
 buttonPrimaryHighlight
 buttonPrimaryDisabled

 buttonSecondary
 buttonSecondaryHighlight
 buttonSecondaryDisabled

 buttonCta
 buttonCtaHighlight
 buttonCtaDisabled

 waitlist
 waitlistHighlight

 link
 linkHighlighted

 signalSuccess
 signalWarning
 signalDelete
 signalError

 backgroundPrimary
 backgroundSecondary
 backgroundSurface

 backgroundTop // ??? 🐲

 border
 tabBar
 shimmer

 selection 🐲

 themeGradientStart 🐲
 themeGradientEnd 🐲

 - ON

 overPrimaryButton
 overPrimaryButtonSecondary

 overSecondaryButton
 overSecondaryButtonSecondary


 ---


 overBackgroundPrimaryEnabledOn
 overBackgroundPrimaryEnabledOff

 overBackgroundPrimaryDisabledOn
 overBackgroundPrimaryDisabledOff

 overBackgroundPrimaryWithPrimary

 ---

 enabledOnOverBackground
 enabledOffOverBackground

 disabledOnOverBackground
 disabledOffOverBackground

 primaryOverBackground
 secondaryOverBackground
 disabledOverBackground


 -
 enabledOnOverBackgroundPrimary
 enabledOffOverBackgroundPrimary

 disabledOnOverBackgroundPrimary
 disabledOffOverBackgroundPrimary

 primaryOverBackgroundPrimary
 secondaryOverBackgroundPrimary
 disabledOverBackgroundPrimary


 -

 enabledOnOverBackgroundSecondary
 enabledOffOverBackgroundSecondary

 disabledOnOverBackgroundSecondary
 disabledOffOverBackgroundSecondary

 primaryOverBackgroundSecondary
 secondaryOverBackgroundSecondary
 disabledOverBackgroundSecondary



 ----

 onPrimaryButton -- Secondary?


 - primary
 - secondary
 - cta
 - surface
 - background


 - enabled - on
 - enabled - off
 - disabled - on
 - disabled - off
 - primary
 - seconday
 - disabled

 ----

 ON colors: https://material.io/design/color/the-color-system.html#color-theme-creation
 icons
 text
 strokes?
 surfaces?

 --------

 Dimensions

 - semantic color
    - states
 - light/dark


 ....
 - positive/negative
 - on?




 --------------

 Button
    - Primary
    - Secondary
    - CTA
    - Waitlist

    - states
        - normal / default
        - hightlighted / hover
        - disabled

 - link
 - signal


 ------------------

 Button/Primary/Default/Light
 Button/Primary/Hover/Light
 Button/Primary/Disabled/Light


 ------ THEME

 - Background
 - Selection
 - Gradient


 */
