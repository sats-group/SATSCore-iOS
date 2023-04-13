import SwiftUI

public extension View {
    /// Intended mostly for images, it will use a given height in `horizontalSizeClass` `compact`
    /// and another value for the `regular` case
    /// - Parameters:
    ///   - compact: height for the compact horizontal case
    ///   - regular: height for the regular horizontal case
    func sizeClassHeight(compact: CGFloat = 240, regular: CGFloat = 360) -> some View {
        modifier(ImageSizeClassHeightModifier(compactHeight: compact, regularHeigth: regular))
    }
}

private struct ImageSizeClassHeightModifier: ViewModifier {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    let compactHeight: CGFloat
    let regularHeigth: CGFloat

    init(compactHeight: CGFloat, regularHeigth: CGFloat) {
        self.compactHeight = compactHeight
        self.regularHeigth = regularHeigth
    }

    func body(content: Content) -> some View {
        content
            .frame(height: horizontalSizeClass == .regular ? regularHeigth : compactHeight)
    }
}
