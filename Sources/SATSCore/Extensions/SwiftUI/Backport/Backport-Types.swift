import SwiftUI

/// An internal type to encapsulate the backported types
struct Backported {}

extension Backported {
    struct TaskModifier: ViewModifier {
        let action: () async -> Void
        @State var currentTask: Task<Void, Never>?

        init(action: @escaping () async -> Void) {
            self.action = action
        }

        func body(content: Content) -> some View {
            content
                .onAppear {
                    currentTask = Task {
                        await action()
                    }
                }
                .onDisappear {
                    currentTask?.cancel()
                }
        }
    }
}
