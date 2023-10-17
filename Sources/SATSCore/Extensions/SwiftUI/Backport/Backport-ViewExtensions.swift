import SwiftUI

public extension View {
    var backport: Backport<Self> { Backport(self) }
}

public extension Backport where Content: View {
    /// This is needed as TextViews in iOS 16 have an extra background
    @available(iOS, deprecated: 16, message: "This is a backported version that is not neeeded anymore")
    @ViewBuilder func hideScrollContentBackground() -> some View {
        if #available(iOS 16.0, *) {
            content
                .scrollContentBackground(.hidden)
        } else {
            content
        }
    }

    // here there will backported extensions when needed for iOS 16
    @available(iOS, deprecated: 16, message: "This is a backported version that is not neeeded anymore")
    @ViewBuilder func scrollDismissesKeyboard(_ visibility: ScrollDismissesKeyboard) -> some View {
        if #available(iOS 16, *) {
            content
                .scrollDismissesKeyboard(visibility.mode)
        } else {
            content
        }
    }

    @available(iOS, deprecated: 16, message: "This is a backported version that is not neeeded anymore")
    enum ScrollDismissesKeyboard {
        // Determine the mode automatically based on the surrounding context
        case automatic
        // Dismiss the keyboard as soon as scrolling starts
        case immediately
        // Enable people to interactively dismiss the keyboard as part of the scroll operation
        case interactively
        // Never dismiss the keyboard automatically as a result of scrolling
        case never

        @available(iOS 16, *)
        var mode: ScrollDismissesKeyboardMode {
            switch self {
            case .automatic:
                .automatic

            case .immediately:
                .immediately

            case .interactively:
                .interactively

            case .never:
                .never
            }
        }
    }
}
