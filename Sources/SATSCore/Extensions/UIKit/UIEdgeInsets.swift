import UIKit

public extension UIEdgeInsets {
    /// Convenience initializer to set uniform margins
    init(all: CGFloat) {
        self.init(top: all, left: all, bottom: all, right: all)
    }

    /// Convenience initializer to set vertical/horizontal values instead of specifying all of them
    init(vertical: CGFloat, horizontal: CGFloat) {
        self.init(
            top: vertical,
            left: horizontal,
            bottom: vertical,
            right: horizontal
        )
    }
}
