import SwiftUI

public struct ActionSheetViewData: Identifiable, Equatable {
    public let id: String
    public let title: String
    public let message: String?
    public let actions: [ActionViewData]

    public init(id: String? = nil, title: String, message: String?, actions: [ActionViewData]) {
        self.id = id ?? UUID().uuidString
        self.title = title
        self.message = message
        self.actions = actions
    }

    public struct ActionViewData: Equatable {
        public let title: String
        public let isDestructive: Bool
        public let perform: () -> Void

        public init(title: String, isDestructive: Bool = false, perform: @escaping () -> Void) {
            self.title = title
            self.isDestructive = isDestructive
            self.perform = perform
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            lhs.title == rhs.title
        }
    }
}

public extension ActionSheet {
    init(viewData: ActionSheetViewData) {
        var buttons: [Button] = viewData.actions
            .map { action in
                if action.isDestructive {
                    Button.destructive(Text(action.title), action: action.perform)
                } else {
                    Button.default(Text(action.title), action: action.perform)
                }
            }
        buttons.append(.cancel())

        self.init(
            title: Text(viewData.title),
            message: viewData.message.map { Text($0) },
            buttons: buttons
        )
    }
}
