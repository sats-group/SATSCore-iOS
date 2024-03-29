import UIKit

#if os(iOS)
public extension SATSButton {
    /// Specifies a resizing behaviour of the button
    struct Size: Equatable {
        public let contentEdgeInsets: UIEdgeInsets
        public let imageEdgeInsets: UIEdgeInsets
        public let contentHuggingPriority: UILayoutPriority

        public init(
            contentEdgeInsets: UIEdgeInsets,
            imageEdgeInsets: UIEdgeInsets,
            contentHuggingPriority: UILayoutPriority
        ) {
            self.contentEdgeInsets = contentEdgeInsets
            self.imageEdgeInsets = imageEdgeInsets
            self.contentHuggingPriority = contentHuggingPriority
        }

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

extension SATSButton.Size: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(contentEdgeInsets.left)
        hasher.combine(imageEdgeInsets.left)
        hasher.combine(contentHuggingPriority.rawValue)
    }
}

// MARK: - SwiftUI adjustments

extension SATSButton.Size {
    var verticalPadding: CGFloat { contentEdgeInsets.top }
    var horizontalPadding: CGFloat { contentEdgeInsets.left }
}

// MARK: - Default Sizes

public extension SATSButton.Size {
    /// Tall primary button, can grow horizontally.
    static let large = SATSButton.Size(
        contentEdgeInsets: UIEdgeInsets(vertical: .spacingM, horizontal: .spacingM),
        imageEdgeInsets: .zero,
        contentHuggingPriority: .defaultHigh
    )

    /// Small height but allowed to grow horizontally.
    static let basic = SATSButton.Size(
        contentEdgeInsets: UIEdgeInsets(vertical: .spacingXS, horizontal: .spacingM),
        imageEdgeInsets: .zero,
        contentHuggingPriority: .defaultHigh
    )
}
#endif
