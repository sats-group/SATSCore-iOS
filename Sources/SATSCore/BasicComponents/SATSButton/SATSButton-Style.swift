import UIKit

#if os(iOS)
public extension SATSButton {
    /// Specifies a visual theme of the button
    struct Style: Equatable {
        public let name: String

        public let titleColor: UIColor
        public let titleColorHighlight: UIColor?
        public let titleColorDisabled: UIColor

        public let backgroundColor: UIColor
        public let backgroundColorHighlighted: UIColor
        public let backgroundColorDisabled: UIColor

        public let borderColor: UIColor?
        public let borderColorDisabled: UIColor?

        public init(
            name: String,
            titleColor: UIColor,
            titleColorHighlight: UIColor? = nil,
            titleColorDisabled: UIColor,
            backgroundColor: UIColor,
            backgroundColorHighlighted: UIColor,
            backgroundColorDisabled: UIColor,
            borderColor: UIColor? = nil,
            borderColorDisabled: UIColor? = nil
        ) {
            self.name = name
            self.titleColor = titleColor
            self.titleColorHighlight = titleColorHighlight
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
        titleColor: .onPrimaryButton,
        titleColorDisabled: .onPrimaryButtonDisabled,
        backgroundColor: .primaryButton,
        backgroundColorHighlighted: .primaryButtonHighlight,
        backgroundColorDisabled: .primaryButtonDisabled
    )

    static let secondary = SATSButton.Style(
        name: "Secondary",
        titleColor: .onSecondaryButton,
        titleColorHighlight: .onSecondaryButton,
        titleColorDisabled: .onSecondaryButtonDisabled,
        backgroundColor: .backgroundPrimary,
        backgroundColorHighlighted: .secondaryButtonHighlight,
        backgroundColorDisabled: .backgroundPrimary,
        borderColor: .onSecondaryButton,
        borderColorDisabled: .onSecondaryButtonDisabled
    )

    static let tertiary = SATSButton.Style(
        name: "Tertiary",
        titleColor: .action,
        titleColorHighlight: .actionHighlight,
        titleColorDisabled: .actionDisabled,
        backgroundColor: .clear,
        backgroundColorHighlighted: .clear,
        backgroundColorDisabled: .clear
    )

    static let clean = SATSButton.Style(
        name: "Clean",
        titleColor: .onCleanButton,
        titleColorDisabled: .onCleanButtonDisabled,
        backgroundColor: .cleanButton,
        backgroundColorHighlighted: .cleanButtonHighlight,
        backgroundColorDisabled: .cleanButtonDisabled
    )

    static let cleanSecondary = SATSButton.Style(
        name: "CleanSecondary",
        titleColor: .onCleanSecondaryButton,
        titleColorDisabled: .onCleanSecondaryButtonDisabled,
        backgroundColor: .cleanSecondaryButton,
        backgroundColorHighlighted: .cleanSecondaryButtonHighlight,
        backgroundColorDisabled: .cleanSecondaryButtonDisabled
    )

    static let cta = SATSButton.Style(
        name: "Call To Action",
        titleColor: .onCtaButton,
        titleColorDisabled: .onCtaButtonDisabled,
        backgroundColor: .ctaButton,
        backgroundColorHighlighted: .ctaButtonHighlight,
        backgroundColorDisabled: .ctaButtonDisabled
    )
}
#endif
