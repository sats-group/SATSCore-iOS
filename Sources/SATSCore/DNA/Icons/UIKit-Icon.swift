import UIKit

public extension UIImage {
    static var backArrow: UIImage { icon(.backArrow) }
    static var externalUrl: UIImage { icon(.externalUrl) }

    // MARK: Private

    private static func icon(_ name: IconName) -> UIImage {
        guard let icon = UIImage(named: name.rawValue, in: Bundle.module, compatibleWith: nil) else {
            preconditionFailure("❌ \(name.rawValue) icon not found!")
        }

        return icon.withRenderingMode(.alwaysTemplate)
    }
}
