import UIKit

public extension SATSFont {
    /// Semantic style for text in order to define a hierarchy with text elements
    struct TextStyle: Equatable, Hashable {
        public let size: CGFloat

        /// An equivalent text style in UIKit. Used for dynamic type support
        public let nativeStyle: UIFont.TextStyle

        /// Name of the style, for debugging purposes only
        public let name: String

        public init(size: CGFloat, nativeStyle: UIFont.TextStyle, name: String) {
            self.size = size
            self.nativeStyle = nativeStyle
            self.name = name
        }
    }
}

// swiftlint:disable comma
public extension SATSFont.TextStyle {
    /// 28 pts
    static let h1              = SATSFont.TextStyle(size: 28, nativeStyle: .title1      , name: "h1")
    /// 24 pts
    static let h2              = SATSFont.TextStyle(size: 24, nativeStyle: .title2      , name: "h2")
    /// 20 pts
    static let h3              = SATSFont.TextStyle(size: 20, nativeStyle: .title3      , name: "h3")
    /// 16 pts
    static let large           = SATSFont.TextStyle(size: 16, nativeStyle: .body        , name: "large")
    /// 14 pts
    static let basic           = SATSFont.TextStyle(size: 14, nativeStyle: .callout     , name: "basic")
    /// 12 pts
    static let small           = SATSFont.TextStyle(size: 12, nativeStyle: .footnote    , name: "small")
    /// 16 pts
    static let section         = SATSFont.TextStyle(size: 16, nativeStyle: .body        , name: "section")
    /// 14 pts
    static let button          = SATSFont.TextStyle(size: 14, nativeStyle: .subheadline , name: "button")
    /// 16 pts
    static let navigationTitle = SATSFont.TextStyle(size: 16, nativeStyle: .body        , name: "navigationTitle")
}
