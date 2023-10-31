import SwiftUI

#if os(iOS)
/// Notice is a generic way to configure the `NoticeView` component
/// This struct is available on its own to define custom styles if needed.
/// Normally using `Notice.error`, `Notice.warning` or `Notice.success`
/// is enough
public struct Notice {
    public let icon: Image?
    public let title: String?
    public let message: String
    public let autoDismiss: Bool
    public let tintColor: Color
    public let hapticType: UINotificationFeedbackGenerator.FeedbackType?
    public let actionTitle: String?
    public let action: (() -> Void)?

    public init(
        icon: Image? = nil,
        title: String? = nil,
        message: String,
        autoDismiss: Bool = true,
        tintColor: Color,
        hapticType: UINotificationFeedbackGenerator.FeedbackType? = nil,
        actionTitle: String? = nil,
        action: (() -> Void)? = nil
    ) {
        self.icon = icon
        self.title = title
        self.message = message
        self.autoDismiss = autoDismiss
        self.tintColor = tintColor
        self.hapticType = hapticType
        self.actionTitle = actionTitle
        self.action = action
    }

    /// Creates an error notice data struct
    /// - Parameters:
    ///   - title: (optional) title of the error
    ///   - message: required message of the error
    ///   - autoDismiss: (default `true`) configures the auto dismiss behavior of a notice
    ///   - includeHaptic: (default `true`) enable or disable the haptic when showing this notice
    ///   - actionTitle: (optional) a title for a notice button
    ///   - action: (optional) an action to perform when pressing the action button
    /// - Returns: a `Notice` instance that can be used with `NoticeView`
    public static func error(
        title: String? = nil,
        message: String,
        autoDismiss: Bool = true,
        includeHaptic: Bool = true,
        actionTitle: String? = nil,
        action: (() -> Void)? = nil
    ) -> Notice {
        Notice(
            icon: Image(systemName: "xmark.octagon"),
            title: title,
            message: message,
            autoDismiss: autoDismiss,
            tintColor: .signalError,
            hapticType: includeHaptic ? .error : nil,
            actionTitle: actionTitle,
            action: action
        )
    }

    /// Create a error notice with action options
    /// - Parameters:
    ///   - title: (optional) title of the error
    ///   - message: required message of the error
    ///   - includeHaptic: (default `true`) enable or disable the haptic when showing this notice
    ///   - actionTitle: title for the action button
    ///   - action: callback when the action button is tapped
    /// - Returns: returns a error `Notice` that won't autodismiss that allows to action
    ///            an operation that caused an error
    public static func error(
        title: String? = nil,
        message: String,
        includeHaptic: Bool = true,
        actionTitle: String,
        action: @escaping () -> Void
    ) -> Notice {
        Notice(
            icon: Image(systemName: "xmark.octagon"),
            title: title,
            message: message,
            autoDismiss: false,
            tintColor: .signalError,
            hapticType: includeHaptic ? .error : nil,
            actionTitle: actionTitle,
            action: action
        )
    }

    /// Creates a warning notice data struct
    /// - Parameters:
    ///   - title: (optional) title of the warning
    ///   - message: required message of the warning
    ///   - autoDismiss: (default `true`) configures the auto dismiss behavior of a notice
    ///   - includeHaptic: (default `true`) enable or disable the haptic when showing this notice
    /// - Returns: a `Notice` instance that can be used with `NoticeView`
    public static func warning(
        title: String? = nil,
        message: String,
        autoDismiss: Bool = true,
        includeHaptic: Bool = true,
        actionTitle: String? = nil,
        action: (() -> Void)? = nil
    ) -> Notice {
        Notice(
            icon: Image(systemName: "exclamationmark.triangle"),
            title: title,
            message: message,
            autoDismiss: autoDismiss,
            tintColor: .signalWarning,
            hapticType: includeHaptic ? .warning : nil,
            actionTitle: actionTitle,
            action: action
        )
    }

    /// Creates a success notice data struct
    /// - Parameters:
    ///   - title: (optional) title of the notice
    ///   - message: required message of the notice
    ///   - autoDismiss: (default `true`) configures the auto dismiss behavior of a notice
    ///   - includeHaptic: (default `true`) enable or disable the haptic when showing this notice
    /// - Returns: a `Notice` instance that can be used with `NoticeView`
    public static func success(
        title: String? = nil,
        message: String,
        autoDismiss: Bool = true,
        includeHaptic: Bool = true
    ) -> Notice {
        Notice(
            icon: Image(systemName: "checkmark.circle"),
            title: title,
            message: message,
            autoDismiss: autoDismiss,
            tintColor: .signalSuccess,
            hapticType: includeHaptic ? .success : nil
        )
    }

    /// Creates a info notice data struct
    /// - Parameters:
    ///   - title: (optional) title of the notice
    ///   - message: required message of the notice
    ///   - autoDismiss: (default `true`) configures the auto dismiss behavior of a notice
    ///   - includeHaptic: (default `true`) enable or disable the haptic when showing this notice
    /// - Returns: a `Notice` instance that can be used with `NoticeView`
    public static func info(
        title: String? = nil,
        message: String,
        autoDismiss: Bool = true,
        includeHaptic: Bool = true
    ) -> Notice {
        Notice(
            icon: Image(systemName: "info.circle"),
            title: title,
            message: message,
            autoDismiss: autoDismiss,
            tintColor: .graphicalElements1,
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
#endif
