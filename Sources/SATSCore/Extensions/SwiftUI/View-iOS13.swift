import SwiftUI

extension View {
    /// An easy way to ignore safe area compatible with iOS 13+
    @available(iOS, deprecated: 14, message: "Now you should just use `ignoreSafeArea()`")
    public func compatibleIgnoreSafeArea() -> some View {
        Group {
            if #available(iOS 14.0, *) {
                self.ignoresSafeArea()
            } else {
                self.edgesIgnoringSafeArea(.all)
            }
        }
    }
}
