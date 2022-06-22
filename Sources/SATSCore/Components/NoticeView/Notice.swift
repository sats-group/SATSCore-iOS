import SwiftUI

/// Notice is a generic way to configure the `NoticeView` component
/// This struct is available on its own to define custom styles if needed.
/// Normally using `Notice.error`, `Notice.warning` or `Notice.success`
/// is enough
public struct Notice {
    public let icon: Image?
    public let title: String
    public let explanation: String?
    public let autoDismiss: Bool
    public let foregroundColor: Color
    public let backgroundColor: Color
    public let hapticType: UINotificationFeedbackGenerator.FeedbackType?
    public let actionTitle: String?
    public let action: (() -> Void)?

    public init(
        icon: Image? = nil,
        title: String,
        explanation: String? = nil,
        autoDismiss: Bool = true,
        foregroundColor: Color,
        backgroundColor: Color,
        hapticType: UINotificationFeedbackGenerator.FeedbackType? = nil,
        actionTitle: String? = nil,
        action: (() -> Void)? = nil
    ) {
        self.icon = icon
        self.title = title
        self.explanation = explanation
        self.autoDismiss = autoDismiss
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.hapticType = hapticType
        self.actionTitle = actionTitle
        self.action = action
    }

    /// Creates an error notice data struct
    /// - Parameters:
    ///   - title: required title of the error
    ///   - explanation: (optional) explanation of the error
    ///   - autoDismiss: (default `true`) configures the auto dismiss behavior of a notice
    ///   - includeHaptic: (default `true`) enable or disable the haptic when showing this notice
    /// - Returns: a `Notice` instance that can be used with `NoticeView`
    public static func error(
        title: String,
        explanation: String? = nil,
        autoDismiss: Bool = true,
        includeHaptic: Bool = true
    ) -> Notice {
        Notice(
            icon: Image(systemName: "xmark.octagon.fill"),
            title: title,
            explanation: explanation,
            autoDismiss: autoDismiss,
            foregroundColor: .onSignal,
            backgroundColor: .signalError,
            hapticType: includeHaptic ? .error : nil
        )
    }

    /// Create a error notice with action options
    /// - Parameters:
    ///   - title: required title of the error
    ///   - explanation: (optional) explanation of the error
    ///   - includeHaptic: (default `true`) enable or disable the haptic when showing this notice
    ///   - actionTitle: title for the action button
    ///   - action: callback when the action button is tapped
    /// - Returns: returns a error `Notice` that won't autodismiss that allows to action
    ///            an operation that caused an error
    public static func error(
        title: String,
        explanation: String? = nil,
        includeHaptic: Bool = true,
        actionTitle: String,
        action: @escaping () -> Void
    ) -> Notice {
        Notice(
            icon: Image(systemName: "xmark.octagon.fill"),
            title: title,
            explanation: explanation,
            autoDismiss: false,
            foregroundColor: .onSignal,
            backgroundColor: .signalError,
            hapticType: includeHaptic ? .error : nil,
            actionTitle: actionTitle,
            action: action
        )
    }

    /// Creates a warning notice data struct
    /// - Parameters:
    ///   - title: required title of the warning
    ///   - explanation: (optional) explanation of the warning
    ///   - autoDismiss: (default `true`) configures the auto dismiss behavior of a notice
    ///   - includeHaptic: (default `true`) enable or disable the haptic when showing this notice
    /// - Returns: a `Notice` instance that can be used with `NoticeView
    public static func warning(
        title: String,
        explanation: String? = nil,
        autoDismiss: Bool = true,
        includeHaptic: Bool = true
    ) -> Notice {
        Notice(
            icon: Image(systemName: "exclamationmark.triangle.fill"),
            title: title,
            explanation: explanation,
            autoDismiss: autoDismiss,
            foregroundColor: .onSignal,
            backgroundColor: .signalWarning,
            hapticType: includeHaptic ? .warning : nil
        )
    }

    /// Creates a success notice data struct
    /// - Parameters:
    ///   - title: required title of the notice
    ///   - explanation: (optional) explanation of the notice
    ///   - autoDismiss: (default `true`) configures the auto dismiss behavior of a notice
    ///   - includeHaptic: (default `true`) enable or disable the haptic when showing this notice
    /// - Returns: a `Notice` instance that can be used with `NoticeView
    public static func success(
        title: String,
        explanation: String? = nil,
        autoDismiss: Bool = true,
        includeHaptic: Bool = true
    ) -> Notice {
        Notice(
            icon: Image(systemName: "checkmark.circle.fill"),
            title: title,
            explanation: explanation,
            autoDismiss: autoDismiss,
            foregroundColor: .onSignal,
            backgroundColor: .signalSuccess,
            hapticType: includeHaptic ? .success : nil
        )
    }
}

public extension Notice {
    enum Edge: String, Identifiable, Hashable, Equatable {
        case top
        case bottom

        public var id: String { rawValue }
    }
}
