import SwiftUI

extension View {
    /// A convenience to the `frame` method to define same width/height dimensions
    /// - Parameter size: the value for both width and height
    /// - Parameter alignment: alignment for the frame `.center` as default
    public func frame(size: CGFloat, alignment: Alignment = .center) -> some View {
        frame(width: size, height: size, alignment: alignment)
    }
}
