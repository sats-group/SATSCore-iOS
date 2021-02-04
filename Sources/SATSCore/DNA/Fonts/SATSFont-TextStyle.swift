import UIKit

public extension SATSFont {
    struct TextStyle: Equatable, Hashable {
        public let size: CGFloat

        /// An equivalent text style in UIKit. Used for dynamic type support
        public let nativeStyle: UIFont.TextStyle

        /// Name of the style, for debugging purposes only
        public let name: String
    }
}

public extension SATSFont.TextStyle {
    static let h1              = SATSFont.TextStyle(size: 28, nativeStyle: .title1      , name: "h1")
    static let h2              = SATSFont.TextStyle(size: 24, nativeStyle: .title2      , name: "h2")
    static let h3              = SATSFont.TextStyle(size: 20, nativeStyle: .title3      , name: "h3")
    static let large           = SATSFont.TextStyle(size: 16, nativeStyle: .body        , name: "large")
    static let basic           = SATSFont.TextStyle(size: 14, nativeStyle: .callout     , name: "basic")
    static let small           = SATSFont.TextStyle(size: 12, nativeStyle: .footnote    , name: "small")
    static let section         = SATSFont.TextStyle(size: 16, nativeStyle: .body        , name: "section")
    static let button          = SATSFont.TextStyle(size: 14, nativeStyle: .subheadline , name: "button")
    static let navigationTitle = SATSFont.TextStyle(size: 16, nativeStyle: .body        , name: "navigationTitle")
}
