import SwiftUI

public extension View {
    var backport: Backport<Self> { Backport(self) }
}

public extension Backport where Content: View {
    @available(iOS, deprecated: 15, message: "This is a backported version that is not neeeded anymore")
    @ViewBuilder func tint(_ color: Color?) -> some View {
        if #available(iOS 15, *) {
            content.tint(color)
        } else {
            // deprecated version
            content.accentColor(color)
        }
    }
}
