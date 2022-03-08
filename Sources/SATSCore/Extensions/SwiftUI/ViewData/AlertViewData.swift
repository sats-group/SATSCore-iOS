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
    public let actionButtonStyle: ActionButtonStyle

    public init(
        id: String? = nil,
        title: String,
        message: String,
        actionButtonStyle: ActionButtonStyle = .default,
        actionTitle: String,
        action: @escaping () -> Void
    ) {
        self.id = id ?? UUID().uuidString
        self.title = title
        self.message = message
        self.actionButtonStyle = actionButtonStyle
        self.actionTitle = actionTitle
        self.action = action
    }

    public static func == (lhs: AlertViewData, rhs: AlertViewData) -> Bool {
        lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.message == rhs.message &&
            lhs.actionTitle == rhs.actionTitle
    }
    
    public enum ActionButtonStyle {
        case `default`
        case destructive
    }
}

public extension Alert {
    /// Creates an alert from view data, this include a default cancel button
    init(viewData: AlertViewData)  {
        let primaryButton: Alert.Button

        switch viewData.actionButtonStyle {
        case .`default`:
            primaryButton = .default(Text(viewData.actionTitle), action: viewData.action)

        case .destructive :
            primaryButton = .destructive(Text(viewData.actionTitle), action: viewData.action)
        }
        
        self.init(
            title: Text(viewData.title),
            message: Text(viewData.message),
            primaryButton: primaryButton,
            secondaryButton: .cancel()
        )
    }
}
