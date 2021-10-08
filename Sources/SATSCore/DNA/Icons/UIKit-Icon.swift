import UIKit

extension UIImage {
    static var back: UIImage { icon(.back) }
    static var close: UIImage { icon(.close) }
    static var linkExternal: UIImage { icon(.linkExternal) }

    // MARK: Private

    private static func icon(_ name: IconName) -> UIImage {
        guard let icon = UIImage(named: name.rawValue, in: Bundle.module, compatibleWith: nil) else {
            preconditionFailure("❌ \(name.rawValue) icon not found!")
        }

        return icon
    }
}
