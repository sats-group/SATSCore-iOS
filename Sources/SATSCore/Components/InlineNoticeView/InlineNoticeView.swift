import UIKit

public class InlineNoticeView: UIView {

    // MARK: Subviews

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(withAutoLayout: true)
        imageView.fixed(size: 48)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var titleLabel: SATSLabel = {
        let label = SATSLabel(style: .large, weight: .emphasis)
        return label
    }()

    private lazy var descriptionLabel: SATSLabel = {
        let label = SATSLabel(style: .basic)
        label.textColor = .onSurfaceSecondary
        return label
    }()

    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView(withAutoLayout: true)
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()

    // MARK: Initializers

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    // MARK: Internal methods

    public func configure(icon: UIImage?, title: String, subtitle: String) {
        iconImageView.image = icon
        titleLabel.text = title
        descriptionLabel.text = subtitle
    }

    // MARK: Private methods

    private func setup() {
        backgroundColor = .backgroundSurfacePrimary
        layoutMargins = UIEdgeInsets(vertical: 16, horizontal: 20)

        let topSeparator = horizontalSeparatorView()
        let bottomSeparator = horizontalSeparatorView()
        let containerView = UIView(withAutoLayout: true)

        [
            topSeparator,
            containerView,
            bottomSeparator,
        ].forEach(addSubview(_:))

        [
            iconImageView,
            textStackView,
        ].forEach(containerView.addSubview(_:))

        [
            titleLabel,
            descriptionLabel,
        ].forEach(textStackView.addArrangedSubview(_:))

        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

            textStackView.topAnchor.constraint(greaterThanOrEqualTo: containerView.topAnchor),
            textStackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            textStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            textStackView.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor),
            textStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),

            containerView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            containerView.leadingAnchor.constraint(greaterThanOrEqualTo: layoutMarginsGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(lessThanOrEqualTo: layoutMarginsGuide.trailingAnchor),
            containerView.widthAnchor.constraint(equalTo: readableContentGuide.widthAnchor),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),

            topSeparator.topAnchor.constraint(equalTo: topAnchor),
            topSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            topSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),

            bottomSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
