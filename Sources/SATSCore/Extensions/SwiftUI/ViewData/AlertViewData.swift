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
    public let secondaryButtonStyle: ActionButtonStyle
    public let secondaryActionTitle: String?
    public let secondaryAction: (() -> Void)?

    public init(
        id: String? = nil,
        title: String,
        message: String,
        actionButtonStyle: ActionButtonStyle = .default,
        actionTitle: String,
        action: @escaping () -> Void,
        secondaryButtonStyle: ActionButtonStyle = .default,
        secondaryActionTitle: String? = nil,
        secondaryAction: (() -> Void)? = nil
    ) {
        self.id = id ?? UUID().uuidString
        self.title = title
        self.message = message
        self.actionButtonStyle = actionButtonStyle
        self.actionTitle = actionTitle
        self.action = action
        self.secondaryButtonStyle = secondaryButtonStyle
        self.secondaryActionTitle = secondaryActionTitle
        self.secondaryAction = secondaryAction
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
    init(viewData: AlertViewData) {
        let primaryButton = Self.createActionButton(
            style: viewData.actionButtonStyle,
            title: viewData.actionTitle,
            action: viewData.action
        )

        let secondaryButton = Self.createActionButton(
            style: viewData.secondaryButtonStyle,
            title: viewData.secondaryActionTitle,
            action: viewData.secondaryAction
        )

        self.init(
            title: Text(viewData.title),
            message: Text(viewData.message),
            primaryButton: primaryButton,
            secondaryButton: secondaryButton
        )
    }

    private static func createActionButton(
        style: AlertViewData.ActionButtonStyle?,
        title: String?,
        action: (() -> Void)?
    ) -> Alert.Button {
        guard
            let style = style,
            let title = title,
            let action = action
        else { return .cancel() }

        switch style {
        case .default:
            return .default(Text(title), action: action)

        case .destructive:
            return .destructive(Text(title), action: action)
        }
    }
}
