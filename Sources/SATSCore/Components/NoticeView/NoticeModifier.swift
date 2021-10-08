import SwiftUI

/// Internal modifier, it should only be used via the `View.inlineNotice` method
struct NoticeModifier: ViewModifier {
    @Binding var notice: Notice?
    let edge: Notice.Edge

    private let transitionDuration: TimeInterval = 0.2
    private let autoDismissTime: TimeInterval = 5

    func body(content: Content) -> some View {
        content
            .overlay(
                ZStack {
                    Color.clear
                    noticeOverlay
                }
                .clipped()
            )
    }

    var noticeOverlay: some View {
        VStack {
            topSpacer
            noticeView
            bottomSpacer
        }
    }

    @ViewBuilder var noticeView: some View {
        if let notice = notice {
            NoticeView(notice: notice, onTap: dimissNotice)
                .animation(.easeInOut(duration: transitionDuration))
                .transition(.move(edge: edge == .top ? .top : .bottom))
                .onAppear(perform: scheduleAutoDismissIfNeeded)
                .onAppear(perform: semanticHapticIfNeeded)
        }
    }

    @ViewBuilder private var topSpacer: some View {
        if edge == .bottom {
            Spacer()
        }
    }

    @ViewBuilder private var bottomSpacer: some View {
        if edge == .top {
            Spacer()
        }
    }

    private func dimissNotice() {
        withAnimation { notice = nil }
    }

    private func scheduleAutoDismissIfNeeded() {
        guard
            let notice = notice,
            notice.autoDismiss
        else { return }

        DispatchQueue
            .main
            .asyncAfter(
                deadline: .now() + autoDismissTime,
                execute: dimissNotice
            )
    }

    private func semanticHapticIfNeeded() {
        guard let hapticType = notice?.hapticType else { return }

        UINotificationFeedbackGenerator().notificationOccurred(hapticType)
    }
}

public extension View {
    /// Adds a inline notice to the screen
    /// - Parameters:
    ///   - notice: inline notice content to show
    ///   - edge: which edge to default `.top` (options: `.top` and `.bottom`)
    /// - Returns: applies the internal modifier that wraps a view in a zstack and manages the behavior of the notice
    func inlineNotice(_ notice: Binding<Notice?>, edge: Notice.Edge = .top) -> some View {
        self.modifier(NoticeModifier(notice: notice, edge: edge))
    }
}
