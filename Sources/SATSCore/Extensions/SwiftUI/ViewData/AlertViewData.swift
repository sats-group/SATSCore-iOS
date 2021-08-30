import SwiftUI

/// A way to represent the content of an alert, that is testable
/// due that we cannot inspect the properties of a `SwiftUI.Alert`
/// value
public struct AlertViewData: Identifiable, Equatable {
    public let id: String
    public let title: String
    public let message: String
    public let actionTitle: String
    public let action: () -> Void

    public static func == (lhs: AlertViewData, rhs: AlertViewData) -> Bool {
        lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.message == rhs.message &&
            lhs.actionTitle == rhs.actionTitle
    }
}

public extension Alert {
    /// Creates an alert from view data, this include a default cancel button
    init(viewData: AlertViewData) {
        self.init(
            title: Text(viewData.title),
            message: Text(viewData.message),
            primaryButton: .default(Text(viewData.actionTitle), action: viewData.action),
            secondaryButton: .cancel()
        )
    }
}
