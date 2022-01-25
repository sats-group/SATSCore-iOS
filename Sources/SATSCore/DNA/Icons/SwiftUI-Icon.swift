import SwiftUI

extension Image {
    static var back: Image { icon(.back) }
    static var close: Image { icon(.close) }
    static var linkExternal: Image { icon(.linkExternal) }

    static var noticeSuccess: Image { icon(.noticeSuccess) }
    static var noticeWarning: Image { icon(.noticeWarning) }
    static var noticeError: Image { icon(.noticeError) }

    private static func icon(_ name: IconName) -> Image {
        Image(name.rawValue, bundle: .module)
            .renderingMode(.template)
    }
}
