import UIKit

public enum SATSTopBarButton {
    case back
    case close

    var icon: UIImage {
        switch self {
        case .back: return .back
        case .close: return .close
        }
    }
}

public enum SATSTopBarStyle {
    case solid
    case transparent
}

public class SATSTopBar: UIView {

    // MARK: Private properties

    private let onSolidIconColor = UIColor(red: 0.49, green: 0.57, blue: 0.68, alpha: 1) // IcoPositivePrimary
    private var titleLayoutConstraint = NSLayoutConstraint()
    private var style: SATSTopBarStyle = .solid {
        didSet {
            updateLayout()
        }
    }

    // MARK: Views

    private lazy var horizontalWrapperView: UIView = {
        let view = UIView(withAutoLayout: true)
        view.layoutMargins = .init(all: 4)
        return view
    }()

    private lazy var leftButtonWrapper: UIStackView = {
        let stackView = UIStackView(withAutoLayout: true)
        stackView.spacing = 4
        stackView.axis = .horizontal
        return stackView
    }()

    private lazy var rightButtonWrapper: UIStackView = {
        let stackView = UIStackView(withAutoLayout: true)
        stackView.spacing = 4
        stackView.axis = .horizontal
        return stackView
    }()

    private lazy var titleLabel: SATSLabel = {
        let label = SATSLabel(style: .h3, weight: .medium)
        label.textAlignment = .center
        return label
    }()

    private lazy var verticalWrapperStackView: UIStackView = {
        let stackView = UIStackView(withAutoLayout: true)
        stackView.axis = .vertical
        return stackView
    }()

    private lazy var borderView: UIView = {
        let view = UIView(withAutoLayout: true)
        return view
    }()

    // MARK: - Initializers

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: Public methods

extension SATSTopBar {
    public func configure(with title: String, style: SATSTopBarStyle = .solid) {
        titleLabel.text = title
        self.style = style
    }

    public func addLeftButton(type: SATSTopBarButton, action: Selector) {
        let button = createButton(type: type, action: action)
        leftButtonWrapper.addArrangedSubview(button)
        updateLayout()
    }

    public func addRightButton(type: SATSTopBarButton, action: Selector) {
        let button = createButton(type: type, action: action)
        rightButtonWrapper.addArrangedSubview(button)
        updateLayout()
    }

    public func hideTitle(animated: Bool = false) {
        let frameHeight = frame.height
        if titleLayoutConstraint.constant == frameHeight { return }

        if animated {
            UIView.animate(withDuration: 0.2) {
                self.titleLayoutConstraint.constant = frameHeight
                self.layoutIfNeeded()
            }
        } else {
            titleLayoutConstraint.constant = frameHeight
        }
    }

    public func showTitle(animated: Bool = false) {
        if titleLayoutConstraint.constant == 0 { return }

        if animated {
            UIView.animate(withDuration: 0.2) {
                self.titleLayoutConstraint.constant = 0
                self.layoutIfNeeded()
            }
        } else {
            titleLayoutConstraint.constant = 0
        }
    }

    public func setStyle(style: SATSTopBarStyle, animated: Bool = false) {
        if self.style == style { return }

        if animated {
            UIView.animate(withDuration: 0.2) {
                self.style = style
                self.layoutIfNeeded()
            }
        } else {
            self.style = style
        }
    }
}

// MARK: Private methods

extension SATSTopBar {
    private func setup() {
        clipsToBounds = true

        [
            leftButtonWrapper,
            titleLabel,
            rightButtonWrapper,
        ].forEach { horizontalWrapperView.addSubview($0) }

        [
            horizontalWrapperView,
            borderView,
        ].forEach { verticalWrapperStackView.addArrangedSubview($0) }

        addSubview(verticalWrapperStackView)

        verticalWrapperStackView.pin(to: self)

        titleLayoutConstraint = titleLabel.centerYAnchor.constraint(
            equalTo: horizontalWrapperView.centerYAnchor,
            constant: frame.height
        )

        NSLayoutConstraint.activate([
            leftButtonWrapper.leadingAnchor.constraint(equalTo: horizontalWrapperView.layoutMarginsGuide.leadingAnchor),
            leftButtonWrapper.topAnchor.constraint(equalTo: horizontalWrapperView.layoutMarginsGuide.topAnchor),
            leftButtonWrapper.bottomAnchor.constraint(equalTo: horizontalWrapperView.layoutMarginsGuide.bottomAnchor),
            leftButtonWrapper.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -4),

            titleLabel.centerXAnchor.constraint(equalTo: horizontalWrapperView.centerXAnchor),
            titleLayoutConstraint,
            titleLabel.trailingAnchor.constraint(equalTo: rightButtonWrapper.leadingAnchor, constant: -4),

            rightButtonWrapper.trailingAnchor.constraint(
                equalTo: horizontalWrapperView.layoutMarginsGuide.trailingAnchor
            ),
            rightButtonWrapper.topAnchor.constraint(equalTo: horizontalWrapperView.layoutMarginsGuide.topAnchor),
            rightButtonWrapper.bottomAnchor.constraint(equalTo: horizontalWrapperView.layoutMarginsGuide.bottomAnchor),

            borderView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }

    private func createButton(type: SATSTopBarButton, action: Selector) -> UIButton {
        let button = UIButton(withAutoLayout: true)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.fixed(size: 48)
        button.setImage(type.icon, for: .normal)
        return button
    }

    private func updateLayout() {
        let buttons = leftButtonWrapper.arrangedSubviews + rightButtonWrapper.arrangedSubviews
        switch style {
        case .solid:
            titleLabel.textColor = .onSecondary
            backgroundColor = .backgroundSecondary
            borderView.backgroundColor = .border
            buttons.forEach { $0.tintColor = onSolidIconColor }

        case .transparent:
            titleLabel.textColor = .onPrimary
            backgroundColor = .clear
            borderView.backgroundColor = .clear
            buttons.forEach { $0.tintColor = .onPrimary }
        }
    }
}
