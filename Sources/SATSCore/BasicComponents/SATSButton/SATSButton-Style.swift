import UIKit

public extension SATSButton {
    /// Specifies a visual theme of the button
    struct Style: Equatable {
        public let name: String

        public let titleColor: UIColor
        public let titleColorDisabled: UIColor

        public let backgroundColor: UIColor
        public let backgroundColorHighlighted: UIColor
        public let backgroundColorDisabled: UIColor

        func backgroundColor(forState state: UIControl.State) -> UIColor {
            switch state {
            case .highlighted:
                return backgroundColorHighlighted
            case .disabled:
                return backgroundColorDisabled
            default:
                return backgroundColor
            }
        }
    }
}

// MARK: - Default Styles

public extension SATSButton.Style {
    static let primary = SATSButton.Style(
        name: "Primary",
        titleColor: .onPrimary,
        titleColorDisabled: .onPrimaryDisabled,
        backgroundColor: .primary,
        backgroundColorHighlighted: .primaryHighlight,
        backgroundColorDisabled: .primaryDisabled
    )

    static let secondary = SATSButton.Style(
        name: "Secondary",
        titleColor: .onSecondary,
        titleColorDisabled: .onSecondaryDisabled,
        backgroundColor: .secondary,
        backgroundColorHighlighted: .secondaryHighlight,
        backgroundColorDisabled: .secondaryDisabled
    )

//    static let clean = SATSButton.Style(
//        name: "Clean",
//        titleColor: .onSecondary,
//        titleColorDisabled: .onSecondaryDisabled,
//        backgroundColor: .clean,
//        backgroundColorHighlighted: .secondaryHighlight,
//        backgroundColorDisabled: .secondaryDisabled
//    )

    static let cta = SATSButton.Style(
        name: "Call To Action",
        titleColor: .onCta,
        titleColorDisabled: .onCtaDisabled,
        backgroundColor: .cta,
        backgroundColorHighlighted: .ctaHighlight,
        backgroundColorDisabled: .ctaDisabled
    )
}
