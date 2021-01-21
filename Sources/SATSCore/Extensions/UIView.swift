import UIKit

extension UIView {
    /// Convenience initalizer to create views ready to be used with autoLayout
    /// - Parameter withAutoLayout
    convenience init(withAutoLayout: Bool) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = !withAutoLayout
    }
}
