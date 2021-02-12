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
        titleColor: .onButtonPrimary,
        titleColorDisabled: .onButtonPrimarySecondary,
        backgroundColor: .buttonPrimary,
        backgroundColorHighlighted: .buttonPrimaryHighlight,
        backgroundColorDisabled: .buttonPrimaryDisabled
    )

    static let secondary = SATSButton.Style(
        name: "Secondary",
        titleColor: .onButtonSecondary,
        titleColorDisabled: .onButtonSecondarySecondary,
        backgroundColor: .buttonSecondary,
        backgroundColorHighlighted: .buttonSecondaryHighlight,
        backgroundColorDisabled: .buttonSecondaryDisabled
    )

    static let cta = SATSButton.Style(
        name: "Call To Action",
        titleColor: .onButtonCta,
        titleColorDisabled: .onButtonCtaSecondary,
        backgroundColor: .buttonCta,
        backgroundColorHighlighted: .buttonCtaHighlight,
        backgroundColorDisabled: .buttonCtaDisabled
    )
}
