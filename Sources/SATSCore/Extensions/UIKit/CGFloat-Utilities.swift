import CoreGraphics

public extension CGFloat {
    /// Convenience constant for maxWidth in SwiftUI. Smaller than
    /// UIKit readableContent's width
    static let readableWidthM: CGFloat = 540

    /// Convenience constant for maxWidth in SwiftUI. Replicates UIKit's
    /// readableContent guide's width
    static let readableWidthL: CGFloat = 664

    /// Commonly used value for padding from the horizontal borders
    /// of the screen
    static let standardHorizontalPadding: CGFloat = 20
}
