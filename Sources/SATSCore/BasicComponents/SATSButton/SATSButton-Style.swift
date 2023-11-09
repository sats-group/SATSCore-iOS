import UIKit

#if os(iOS)
public extension SATSButton {
    /// Specifies a visual theme of the button
    struct Style: Equatable {
        public let name: String

        public let titleColor: UIColor
        public let titleColorDisabled: UIColor

        public let backgroundColor: UIColor
        public let backgroundColorHighlighted: UIColor
        public let backgroundColorDisabled: UIColor

        public let borderColor: UIColor?
        public let borderColorDisabled: UIColor?

        public init(
            name: String,
            titleColor: UIColor,
            titleColorDisabled: UIColor,
            backgroundColor: UIColor,
            backgroundColorHighlighted: UIColor,
            backgroundColorDisabled: UIColor,
            borderColor: UIColor? = nil,
            borderColorDisabled: UIColor? = nil
        ) {
            self.name = name
            self.titleColor = titleColor
            self.titleColorDisabled = titleColorDisabled

            self.backgroundColor = backgroundColor
            self.backgroundColorHighlighted = backgroundColorHighlighted
            self.backgroundColorDisabled = backgroundColorDisabled

            self.borderColor = borderColor
            self.borderColorDisabled = borderColorDisabled
        }

        func backgroundColor(forState state: UIControl.State) -> UIColor {
            switch state {
            case .highlighted:
                backgroundColorHighlighted
            case .disabled:
                backgroundColorDisabled
            default:
                backgroundColor
            }
        }

        func borderColor(forState state: UIControl.State) -> UIColor? {
            switch state {
            case .disabled:
                borderColorDisabled
            default:
                borderColor
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
        backgroundColor: .cleanButton,
        backgroundColorHighlighted: .cleanButtonHighlight,
        backgroundColorDisabled: .cleanButtonDisabled
    )

    static let cleanSecondary = SATSButton.Style(
        name: "CleanSecondary",
        titleColor: .onCleanSecondary,
        titleColorDisabled: .onCleanSecondaryDisabled,
        backgroundColor: .cleanSecondaryButton,
        backgroundColorHighlighted: .cleanSecondaryButtonHighlight,
        backgroundColorDisabled: .cleanSecondaryButtonDisabled
    )

    static let cta = SATSButton.Style(
        name: "Call To Action",
        titleColor: .onCta,
        titleColorDisabled: .onCtaDisabled,
        backgroundColor: .ctaButton,
        backgroundColorHighlighted: .ctaButtonHighlight,
        backgroundColorDisabled: .ctaButtonDisabled
    )
}
#endif
