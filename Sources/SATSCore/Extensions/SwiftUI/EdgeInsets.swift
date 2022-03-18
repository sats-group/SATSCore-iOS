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

    /// Convenience initializer to set top margin instead of specifying all of them
    init(top: CGFloat) {
        self.init(top: top, leading: 0, bottom: 0, trailing: 0)
    }

    /// Convenience initializer to set leading margin instead of specifying all of them
    init(leading: CGFloat) {
        self.init(top: 0, leading: leading, bottom: 0, trailing: 0)
    }

    /// Convenience initializer to set bottom margin instead of specifying all of them
    init(bottom: CGFloat) {
        self.init(top: 0, leading: 0, bottom: bottom, trailing: 0)
    }

    /// Convenience initializer to set trailing margin instead of specifying all of them
    init(trailing: CGFloat) {
        self.init(top: 0, leading: 0, bottom: 0, trailing: trailing)
    }
}
