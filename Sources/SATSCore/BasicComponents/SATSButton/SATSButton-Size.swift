import UIKit

public extension SATSButton {
    /// Specifies a resizing behaviour of the button
    struct Size {
        let contentEdgeInsets: UIEdgeInsets
        let imageEdgeInsets: UIEdgeInsets
        let contentHuggingPriority: UILayoutPriority

        func adjustContentInsets(with contentSpacing: CGFloat) -> UIEdgeInsets {
            UIEdgeInsets(
                top: contentEdgeInsets.top,
                left: contentEdgeInsets.left,
                bottom: contentEdgeInsets.bottom,
                right: contentEdgeInsets.right + contentSpacing
            )
        }
    }
}

// MARK: - Default Sizes

public extension SATSButton.Size {
    /// Tall primary button, can grow horizontally.
    static let large = SATSButton.Size(
        contentEdgeInsets: UIEdgeInsets(all: 20),
        imageEdgeInsets: .zero,
        contentHuggingPriority: .defaultLow
    )

    /// Small height but allowed to grow horizontally.
    static let regular = SATSButton.Size(
        contentEdgeInsets: UIEdgeInsets(vertical: 12, horizontal: 16),
        imageEdgeInsets: .zero,
        contentHuggingPriority: .defaultLow
    )

    /// Compact button that hugs its title as much as possible.
    static let compact = SATSButton.Size(
        contentEdgeInsets: UIEdgeInsets(vertical: 12, horizontal: 20),
        imageEdgeInsets: .zero,
        contentHuggingPriority: .defaultHigh
    )
}
