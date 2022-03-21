import SwiftUI

public extension EdgeInsets {
    /// Convenience initializer to set uniform margins
    init(all: CGFloat) {
        self.init(top: all, leading: all, bottom: all, trailing: all)
    }

    /// Convenience initializer to set vertical/horizontal values instead of specifying all of them
    init(vertical: CGFloat, horizontal: CGFloat) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }

    /// Convenience initializer to set horizontal values instead of specifying all of them
    init(top: CGFloat = 0, horizontal: CGFloat, bottom: CGFloat = 0) {
        self.init(top: top, leading: horizontal, bottom: bottom, trailing: horizontal)
    }
}
