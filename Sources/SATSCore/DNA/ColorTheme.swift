import UIKit

public enum ColorTheme {
    public enum Brand: String, CaseIterable {
        case primaryDark
        case primary
        case primaryLight
        case primaryMiddle
        case secondaryDark
        case secondary
        case secondaryLight
        case purpleDark
        case purple
        case purpleLight
        case border

        public var color: UIColor {
            UIColor(named: rawValue, in: .module, compatibleWith: nil)!
        }
    }

    typealias Icons = IconsPositive

    public enum IconsPositive: String, CaseIterable {
        case primary = "IconPositivePrimary"
        case inactive = "IconPositiveInactive"
        case off = "IconPositiveOff"
        case highlight = "IconPositiveHighlight"

        public var color: UIColor {
            UIColor(named: rawValue, in: .module, compatibleWith: nil)!
        }
    }

    public enum IconsNegative: String, CaseIterable {
        case primary = "IconNegativePrimary"
        case inactive = "IconNegativeInactive"
        case off = "IconNegativeOff"
        case highlight = "IconNegativeHighlight"

        public var color: UIColor {
            UIColor(named: rawValue, in: .module, compatibleWith: nil)!
        }
    }

    public enum SignalPositive: String, CaseIterable {
        case error = "SignalPositiveError"
        case success = "SignalPositiveSuccess"
        case delete = "SignalPositiveDelete"
        case warning = "SignalPositivWarning"

        public var color: UIColor {
            UIColor(named: rawValue, in: .module, compatibleWith: nil)!
        }
    }

    public enum SignalNegative: String, CaseIterable {
        case error = "SignalNegativeError"
        case success = "SignalNegativeSuccess"
        case delete = "SignalNegativeDelete"
        case warning = "SignalNegativeWarning"

        public var color: UIColor {
            UIColor(named: rawValue, in: .module, compatibleWith: nil)!
        }
    }

    public enum TypoNegative: String, CaseIterable {
        case highlight = "TNhighlight"
        case off = "TNoff"
        case primary = "TNprimary"
        case secondary = "TNsecondary"

        public var color: UIColor {
            UIColor(named: rawValue, in: .module, compatibleWith: nil)!
        }
    }

    public enum TypoPositive: String, CaseIterable {
        case highlight = "TPhighlight"
        case off = "TPoff"
        case primary = "TPprimary"
        case secondary = "TPsecondary"

        public var color: UIColor {
            UIColor(named: rawValue, in: .module, compatibleWith: nil)!
        }
    }

    public enum UINegative: String, CaseIterable {
        case background = "UINborder"
        case border = "UINbackground"
        case pressed = "UINpressed"

        public var color: UIColor {
            UIColor(named: rawValue, in: .module, compatibleWith: nil)!
        }
    }

    public enum UIPositive: String, CaseIterable {
        case background = "UIPbackground"
        case border = "UIPborder"
        case overlay = "UIPoverlay"
        case pressed = "UIPpressed"
        case inactive = "UIPInactive"

        public var color: UIColor {
            UIColor(named: rawValue, in: .module, compatibleWith: nil)!
        }
    }

    public enum ButtonNegative: String, CaseIterable {
        case mainDisabled = "ButtonNegativeMainDisabled"
        case mainEnabled = "ButtonNegativeMainEnabled"
        case mainPressed = "ButtonNegativeMainPressed"
        case secondaryDisabled = "ButtonNegativeSecondaryDisabled"
        case secondaryEnabled = "ButtonNegativeSecondaryEnabled"
        case secondaryPressed = "ButtonNegativeSecondaryPressed"

        public var color: UIColor {
            UIColor(named: rawValue, in: .module, compatibleWith: nil)!
        }
    }

    public enum ButtonPositive: String, CaseIterable {
        case mainDisabled = "ButtonPositiveMainDisabled"
        case mainEnabled = "ButtonPositiveMainEnabled"
        case mainPressed = "ButtonPositiveMainPressed"
        case secondaryDisabled = "ButtonPositiveSecondaryDisabled"
        case secondaryEnabled = "ButtonPositiveSecondaryEnabled"
        case secondaryPressed = "ButtonPositiveSecondaryPressed"

        public var color: UIColor {
            UIColor(named: rawValue, in: .module, compatibleWith: nil)!
        }
    }

    func custom(hexString: String, alpha: CGFloat) -> UIColor {
        UIColor(hexString: hexString).withAlphaComponent(alpha)
    }
}
