import SwiftUI

@available(iOS 13.0, *)
public extension Image {
    static var backArrow: Image { icon(.backArrow) }
    static var externalUrl: Image { icon(.externalUrl) }

    private static func icon(_ name: IconName) -> Image {
        Image(name.rawValue, bundle: .module)
            .renderingMode(.template)
    }
}
