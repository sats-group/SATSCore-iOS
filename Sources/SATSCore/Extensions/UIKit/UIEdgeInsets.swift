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

    /// Convenience initializer to set horizontal values instead of specifying all of them
    init(top: CGFloat = 0, horizontal: CGFloat, bottom: CGFloat = 0) {
        self.init(
            top: top,
            left: horizontal,
            bottom: bottom,
            right: horizontal
        )
    }

    /// Convenience initializer that allows to skip values, then those will default to 0
    init(top: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0) {
        self.init(top: top, left: leading, bottom: bottom, right: trailing)
    }
}
