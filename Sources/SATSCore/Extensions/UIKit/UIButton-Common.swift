import UIKit

public extension UIButton {
    static func backButton(onTap action: (() -> Void)? = nil) -> UIButton {
        iconButton(icon: .back, onTap: action)
    }

    static func closeButton(onTap action: (() -> Void)? = nil) -> UIButton {
        iconButton(icon: .close, onTap: action)
    }

    static func backFloatingButton(onTap action: (() -> Void)? = nil) -> UIButton {
        iconButton(icon: .back, isFloating: true, onTap: action)
    }

    static func closeFloatingButton(onTap action: (() -> Void)? = nil) -> UIButton {
        iconButton(icon: .close, isFloating: true, onTap: action)
    }

    private static func iconButton(icon: UIImage?, isFloating: Bool = false, onTap: (() -> Void)? = nil) -> UIButton {
        let button = CallbackButton(withAutoLayout: true)
        button.tintColor = .onSecondary
        button.setImage(icon, for: .normal)
        button.fixed(size: 36)
        button.onTap = onTap

        if isFloating {
            button.backgroundColor = .backgroundSecondary
            button.layer.cornerRadius = 18
        }

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
