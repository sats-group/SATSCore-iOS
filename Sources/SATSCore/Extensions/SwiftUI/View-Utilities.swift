import SwiftUI

extension View {
    /// A convenience to the `frame` method to define same width/height dimensions
    /// - Parameter size: the value for both width and height
    /// - Parameter alignment: alignment for the frame `.center` as default
    public func frame(size: CGFloat, alignment: Alignment = .center) -> some View {
        frame(width: size, height: size, alignment: alignment)
    }

    /// Easily add a rounded border on aview
    /// - Parameters:
    ///   - radius: cornerRadius
    public func roundedBorder(radius: CGFloat, color: Color) -> some View {
        overlay {
            RoundedRectangle(cornerRadius: radius)
                .strokeBorder()
                .foregroundStyle(color)
        }
    }

    /// Limits the width of the content while making the container taking all the available space
    public func readableWidth() -> some View {
        frame(maxWidth: .readableWidthM)
            .frame(maxWidth: .infinity)
    }

    /// Hack to allow `Menu` placed in an area that contains a `onTapGesture`
    /// call to ignore the container's tap gesture, then the `Menu` will open on tap
    public func ignoreOtherTaps() -> some View {
        onTapGesture(perform: {})
    }

    // Temporary implementation of a card with or without shadow that will go in our design system
    public func satsCard(withShadow: Bool = true, backgroundColor: Color = .backgroundSurfacePrimary) -> some View {
        background(backgroundColor)
            .foregroundColor(Color.onSurfacePrimary)
            .cornerRadius(.cornerRadiusS)
            .if(withShadow, transform: { $0.satsShadow() })
    }

    // Temporary implementation of a shadow that will go in our design system
    public func satsShadow() -> some View {
        shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 1)
    }
}
