import SwiftUI

/// A way to wrap a UIView controller quickly for swiftUI
public struct SimpleControllerRepresentable<ViewController: UIViewController>: UIViewControllerRepresentable {
    let factory: () -> ViewController

    /// A way to wrap a UIView controller quickly for swiftUI
    /// - Parameter factory: a closure that will be used to create the view controller.
    ///
    /// Example:
    /// ```swift
    /// // with no parameters
    /// SimpleControllerRepresentable(MyViewController.init)
    ///
    /// // with parameters
    /// SimpleControllerRepresentable { MyViewController(frame: .zero) }
    /// ```
    public init(_ factory: @escaping () -> ViewController) {
        self.factory = factory
    }

    public func makeUIViewController(context: Context) -> ViewController {
        return factory()
    }

    public func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
}
