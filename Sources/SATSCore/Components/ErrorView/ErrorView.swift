import UIKit

private extension SATSButton.Style {
    static let error = SATSButton.Style(
        name: "Error",
        titleColor: .onSignal,
        titleColorDisabled: .onPrimaryDisabled,
        backgroundColor: .signalError,
        backgroundColorHighlighted: UIColor.signalError.withAlphaComponent(0.8),
        backgroundColorDisabled: .primaryDisabled
    )
}

public struct ErrorViewData {
    public let title: String?
    public let message: String
    public let canRetry: Bool

    /// Data to present the error
    /// - Parameters:
    ///   - title: (optional) title
    ///   - message: what went wrong
    ///   - canRetry: (default `true`). If this value is true a "retry" button will be shown.
    ///               The behavior of that button is controlled by the `ErrorView.onRetry` property
    public init(title: String? = nil, message: String, canRetry: Bool = true) {
        self.title = title
        self.message = message
        self.canRetry = canRetry
    }
}

/// A view which displays a title, message and retry button
public class ErrorView: UIView {
    // MARK: Public properties

    public var onRetry: (() -> Void) = {}

    // MARK: Private properties

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(withAutoLayout: true)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 12
        return stackView
    }()

    private lazy var titleLabel: UILabel = {
        let label = SATSLabel(style: .section, weight: .emphasis)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var messageLabel: UILabel = {
        let label = SATSLabel(style: .basic)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var retryButton: SATSButton = {
        let button = SATSButton(style: .error)
        button.setTitle(NSLocalizedString("Retry", comment: "Error screen retry button"), for: .normal)
        button.layoutMargins = UIEdgeInsets(top: 5, horizontal: 45, bottom: 0)
        button.addTarget(self, action: #selector(retryButtonDidTap), for: .touchUpInside)
        return button
    }()

    // MARK: Initializers

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Public methods

    public func configure(with errorData: ErrorViewData) {
        if let title = errorData.title {
            titleLabel.text = title
            titleLabel.isHidden = false
        } else {
            titleLabel.isHidden = true
        }

        messageLabel.text = errorData.message
        retryButton.isHidden = !errorData.canRetry
    }

    // MARK: Private methods

    private func setup() {
        [
            titleLabel,
            messageLabel,
            retryButton,
        ].forEach(stackView.addArrangedSubview(_:))

        addSubview(stackView)

        stackView.centerAndConstraintInSuperview()
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
        ])
    }

    @objc private func retryButtonDidTap() {
        onRetry()
    }
}
