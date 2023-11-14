import UIKit

#if os(iOS)
public extension SATSButton {
    /// Specifies a resizing behaviour of the button
    struct Size: Equatable {
        public let contentEdgeInsets: NSDirectionalEdgeInsets
        public let imagePaddding: CGFloat
        public let contentHuggingPriority: UILayoutPriority

        public init(
            contentEdgeInsets: NSDirectionalEdgeInsets,
            imagePaddding: CGFloat,
            contentHuggingPriority: UILayoutPriority
        ) {
            self.contentEdgeInsets = contentEdgeInsets
            self.imagePaddding = imagePaddding
            self.contentHuggingPriority = contentHuggingPriority
        }
    }
}

extension SATSButton.Size: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(contentEdgeInsets.top)
        hasher.combine(contentEdgeInsets.leading)
        hasher.combine(imagePaddding)
        hasher.combine(contentHuggingPriority.rawValue)
    }
}

// MARK: - SwiftUI adjustments

extension SATSButton.Size {
    var verticalPadding: CGFloat { contentEdgeInsets.top }
    var horizontalPadding: CGFloat { contentEdgeInsets.leading }
}

// MARK: - Default Sizes

public extension SATSButton.Size {
    /// Tall primary button, can grow horizontally.
    static let large = SATSButton.Size(
        contentEdgeInsets: .init(vertical: .spacingM, horizontal: .spacingM),
        imagePaddding: .spacingXS,
        contentHuggingPriority: .defaultHigh
    )

    /// Small height but allowed to grow horizontally.
    static let basic = SATSButton.Size(
        contentEdgeInsets: .init(vertical: .spacingXS, horizontal: .spacingM),
        imagePaddding: .spacingXS,
        contentHuggingPriority: .defaultHigh
    )
}
#endif
