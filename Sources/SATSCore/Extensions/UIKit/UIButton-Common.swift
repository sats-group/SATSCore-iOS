import UIKit

public extension UIButton {
    static func backButton(onTap action: (() -> Void)? = nil) -> UIButton {
        iconButton(icon: .back, onTap: action)
    }

    static func closeButton(onTap action: (() -> Void)? = nil) -> UIButton {
        iconButton(icon: .close, onTap: action)
    }

    private static func iconButton(icon: UIImage?, onTap: (() -> Void)? = nil) -> UIButton {
        let button = CallbackButton(withAutoLayout: true)
        button.setImage(icon, for: .normal)
        button.tintColor = .onPrimary
        button.fixed(size: 48)
        button.onTap = onTap

        return button
    }
}

/// A simple override of UIButton that allows to set a callback
/// instead of the typical target/action approach
class CallbackButton: UIButton {
    /// Setting this callback will override the target/action for the button
    var onTap: (() -> Void)? {
        didSet {
            addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
    }

    @objc private func buttonTapped() {
        onTap?()
    }
}
