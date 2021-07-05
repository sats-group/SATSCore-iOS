import SwiftUI

extension View {
    /// A convenience to the `frame` method to define same width/height dimensions
    /// - Parameter size: the value for both width and height
    public func frame(size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }
}
