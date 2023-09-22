import SwiftUI

struct SizeReaderModifier: ViewModifier {
    let handler: (CGSize) -> Void

    private var geometryView: some View {
        GeometryReader { geometry in
            Color.clear
                .onAppear {
                    DispatchQueue.main.async {
                        handler(geometry.size)
                    }
                }
        }
    }

    func body(content: Content) -> some View {
        content.background(geometryView)
    }
}

extension View {
    /// Given a view, it will pass the read size to the handler closure
    public func sizeReader(_ handler: @escaping (CGSize) -> Void) -> some View {
        modifier(SizeReaderModifier(handler: handler))
    }
}
