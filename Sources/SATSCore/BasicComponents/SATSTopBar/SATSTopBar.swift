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

    // MARK: Public properties

    public var style: SATSTopBarStyle = .solid {
        didSet {
            updateLayout()
        }
    }

    // MARK: Views

    private lazy var horizontalWrapperStackView: UIStackView = {
        let stackView = UIStackView(withAutoLayout: true)
        stackView.axis = .horizontal
        stackView.layoutMargins = .init(all: 5)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    private lazy var leftButtonWrapper: UIStackView = {
        let stackView = UIStackView(withAutoLayout: true)
        stackView.axis = .horizontal
        return stackView
    }()

    private lazy var rightButtonWrapper: UIStackView = {
        let stackView = UIStackView(withAutoLayout: true)
        stackView.axis = .horizontal
        return stackView
    }()

    private lazy var titleLabel: SATSLabel = {
        let label = SATSLabel(style: .h3, weight: .medium, withAutoLayout: true)
        label.textAlignment = .center
        return label
    }()

    private lazy var verticalWrapperStackView: UIStackView = {
        let stackView = UIStackView(withAutoLayout: true)
        stackView.axis = .vertical
        return stackView
    }()

    private lazy var borderView: UIView = {
        let view = UIView()
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

    public func hideTitle(animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.5) {
                self.titleLabel.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            }
        } else {
            titleLabel.topAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }
    }

    public func showTitle(animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.5) {
                self.titleLabel.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = false
            }
        } else {
            titleLabel.topAnchor.constraint(equalTo: bottomAnchor).isActive = false
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
        ].forEach { horizontalWrapperStackView.addArrangedSubview($0) }

        [
            horizontalWrapperStackView,
            borderView,
        ].forEach { verticalWrapperStackView.addArrangedSubview($0) }

        addSubview(verticalWrapperStackView)

        verticalWrapperStackView.pin(to: self)
        borderView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    private func createButton(type: SATSTopBarButton, action: Selector) -> UIButton {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: action, for: .touchUpInside)
        button.fixed(widthAndHeight: 48)
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
