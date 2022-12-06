import SwiftUI

public extension View {
    var backport: Backport<Self> { Backport(self) }
}

public extension Backport where Content: View {
    // here there will backported extensions when needed for iOS 16
    @ViewBuilder
    func scrollDismissesKeyboard(_ visibility: ScrollDismissesKeyboard) -> some View {
        if #available(iOS 16, *) {
            content
                .scrollDismissesKeyboard(visibility.mode)
        } else {
            content
        }
    }

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
                return .automatic

            case .immediately:
                return .immediately

            case .interactively:
                return .interactively

            case .never:
                return .never
            }
        }
    }
}
