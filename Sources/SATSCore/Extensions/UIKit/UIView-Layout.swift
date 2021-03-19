import UIKit

public extension UIView {
    /// Convenience initalizer to create views ready to be used with autoLayout
    /// - Parameter withAutoLayout
    convenience init(withAutoLayout: Bool) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = !withAutoLayout
    }

    func pin(to view: UIView, preserveMargins: Bool = false, includeSafeArea: Bool = false) {
        if preserveMargins {
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
                trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
                topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
                bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            ])
            return
        }

        if includeSafeArea {
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
            return
        }

        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

    }

    /// Convenience method to ensure we pin to a view, but we respect the readable content guide
    func pinWithinReadableContentGuide(to view: UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func center(in view: UIView) {
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    /// Fixed size utility method that makes the height equal to a width
    func fixed(size: CGFloat) {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: size),
            heightAnchor.constraint(equalToConstant: size),
        ])
    }

    /// Set fixed width or height if provided
    ///
    /// If a dimension is not provided, it won't be set.
    func fixed(width: CGFloat? = nil, height: CGFloat? = nil) {
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
