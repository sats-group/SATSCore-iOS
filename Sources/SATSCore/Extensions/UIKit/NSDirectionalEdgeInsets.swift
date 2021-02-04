import UIKit

public extension NSDirectionalEdgeInsets {
    /// Convenience initializer to set uniform margins
    init(all: CGFloat) {
        self.init(top: all, leading: all, bottom: all, trailing: all)
    }

    /// Convenience initializer to set vertical/horizontal values instead of specifying all of them
    init(vertical: CGFloat, horizontal: CGFloat) {
        self.init(
            top: vertical,
            leading: horizontal,
            bottom: vertical,
            trailing: horizontal
        )
    }

    /// Convenience to convert from UIEdgeInsets
    init(_ insets: UIEdgeInsets) {
        self.init(
            top: insets.top,
            leading: insets.left,
            bottom: insets.bottom,
            trailing: insets.right
        )
    }
}
