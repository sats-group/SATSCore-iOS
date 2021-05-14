import UIKit

public struct EmptyStateViewData {
    let icon: UIImage?
    let title: String?
    let description: String?

    public init(icon: UIImage? = nil, title: String? = nil, description: String? = nil) {
        self.icon = icon
        self.title = title
        self.description = description
    }
}

/// Common implementation for empty state screens for the app
public class EmptyStateView: UIView {

    // MARK: Subviews

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(withAutoLayout: true)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 12
        return stackView
    }()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(withAutoLayout: true)
        imageView.fixed(size: 48)
        imageView.backgroundColor = .secondary
        imageView.layer.cornerRadius = 24
        imageView.tintColor = .onBackgroundSecondary
        imageView.contentMode = .center
        imageView.layoutMargins = UIEdgeInsets(all: 12)
        return imageView
    }()

    private lazy var titleLabel: SATSLabel = {
        let label = SATSLabel(style: .section, weight: .emphasis)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var descriptionLabel: SATSLabel = {
        let label = SATSLabel(style: .basic)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
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

    public func configure(with viewData: EmptyStateViewData) {
        titleLabel.text = viewData.title
        titleLabel.isHidden = viewData.title == nil

        iconImageView.image = viewData.icon?.withRenderingMode(.alwaysTemplate)
        iconImageView.isHidden = viewData.icon == nil

        descriptionLabel.text = viewData.description
        descriptionLabel.isHidden = viewData.description == nil
    }

    // MARK: Private methods

    private func setup() {
        backgroundColor = .backgroundPrimary
        layoutMargins = UIEdgeInsets(vertical: 0, horizontal: 40)

        addSubview(contentStackView)

        [
            iconImageView,
            titleLabel,
            descriptionLabel,
        ].forEach(contentStackView.addArrangedSubview(_:))

        contentStackView.centerAndConstraint(in: readableContentGuide)
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalTo: readableContentGuide.widthAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: readableContentGuide.widthAnchor),
        ])
    }
}
