import SwiftUI
import UIKit

/// A generic UIViewRepresentable to present UIViews in Xcode previews, intended for DemoViews
struct DemoWrapperView<DemoView: UIView>: UIViewRepresentable {
    let view: DemoView

    func makeUIView(context: Context) -> DemoView { view }
    func updateUIView(_ uiView: DemoView, context: Context) {}
}

/// A generic NSViewControllerRepresentable to present NSViewController in Xcode previews, intended for DemoViews
struct DemoWrapperViewController<DemoViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: DemoViewController

    func makeUIViewController(context: Context) -> DemoViewController { viewController }
    func updateUIViewController(_ view: DemoViewController, context: Context) {}
}
