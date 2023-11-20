import SwiftUI

extension View {
    /// A convenience to the `frame` method to define same width/height dimensions
    /// - Parameter size: the value for both width and height
    /// - Parameter alignment: alignment for the frame `.center` as default
    public func frame(size: CGFloat, alignment: Alignment = .center) -> some View {
        frame(width: size, height: size, alignment: alignment)
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
