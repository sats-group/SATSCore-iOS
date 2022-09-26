import UIKit

public extension SATSButton {
    /// Specifies a visual theme of the button
    struct Style: Equatable {
        public let name: String

        public let titleColor: UIColor
        public let titleColorHighlighted: UIColor
        public let titleColorDisabled: UIColor

        public let backgroundColor: UIColor?
        public let backgroundColorHighlighted: UIColor?
        public let backgroundColorDisabled: UIColor?

        public let borderColor: UIColor?
        public let borderColorDisabled: UIColor?

        public init(
            name: String,
            titleColor: UIColor,
            titleColorHighlighted: UIColor? = nil,
            titleColorDisabled: UIColor,
            backgroundColor: UIColor? = nil,
            backgroundColorHighlighted: UIColor? = nil,
            backgroundColorDisabled: UIColor? = nil,
            borderColor: UIColor? = nil,
            borderColorDisabled: UIColor? = nil
        ) {
            self.name = name

            self.titleColor = titleColor
            self.titleColorHighlighted = titleColorHighlighted ?? titleColor
            self.titleColorDisabled = titleColorDisabled

            self.backgroundColor = backgroundColor
            self.backgroundColorHighlighted = backgroundColorHighlighted
            self.backgroundColorDisabled = backgroundColorDisabled

            self.borderColor = borderColor
            self.borderColorDisabled = borderColorDisabled
        }

        func backgroundColor(forState state: UIControl.State) -> UIColor? {
            switch state {
            case .highlighted:
                return backgroundColorHighlighted
            case .disabled:
                return backgroundColorDisabled
            default:
                return backgroundColor
            }
        }

        func borderColor(forState state: UIControl.State) -> UIColor? {
            switch state {
            case .disabled:
                return borderColorDisabled
            default:
                return borderColor
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

    static let clean = SATSButton.Style(
        name: "Clean",
        titleColor: .onClean,
        titleColorDisabled: .onCleanDisabled,
        backgroundColor: .clean,
        backgroundColorHighlighted: .cleanHighlight,
        backgroundColorDisabled: .cleanDisabled
    )

    static let cleanSecondary = SATSButton.Style(
        name: "CleanSecondary",
        titleColor: .onCleanSecondary,
        titleColorDisabled: .onCleanSecondaryDisabled,
        backgroundColor: .cleanSecondary,
        backgroundColorHighlighted: .cleanSecondaryHighlight,
        backgroundColorDisabled: .cleanSecondaryDisabled
    )

    static let cta = SATSButton.Style(
        name: "Call To Action",
        titleColor: .onCta,
        titleColorDisabled: .onCtaDisabled,
        backgroundColor: .cta,
        backgroundColorHighlighted: .ctaHighlight,
        backgroundColorDisabled: .ctaDisabled
    )

    static let plain = SATSButton.Style(
        name: "Plain",
        titleColor: .action,
        titleColorHighlighted: .actionHighlighted,
        titleColorDisabled: .actionDisabled,
        backgroundColor: nil
    )
}
