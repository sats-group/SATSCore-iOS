import UIKit

public struct ArticlePageViewData {
    let title: String
    let description: NSAttributedString
    let image: UIImage?
    let externalUrl: SATSExternalUrlViewData?

    public init(
        title: String,
        description: NSAttributedString,
        image: UIImage?,
        externalUrl: SATSExternalUrlViewData?
    ) {
        self.title = title
        self.description = description
        self.image = image
        self.externalUrl = externalUrl
    }
}

public class ArticlePageView: UIView {

    // MARK: - Private
    private let roundedCornerRadius: CGFloat = 8
    private let imageHeight: CGFloat = 230
    private var imageHeightConstraint = NSLayoutConstraint()

    // MARK: - Views

    private lazy var titleLabel: SATSLabel = {
        let label = SATSLabel(style: .h1, weight: .emphasis)
        label.numberOfLines = 0
        return label
    }()

    private lazy var descriptionLabel: SATSLabel = {
        let label = SATSLabel(style: .basic)
        label.numberOfLines = 0
        return label
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(withAutoLayout: true)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var externalUrlView = SATSExternalUrlView(withAutoLayout: true)

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(withAutoLayout: true)
        stackView.backgroundColor = .backgroundSecondary
        stackView.axis = .vertical
        stackView.spacing = 25
        stackView.layoutMargins = UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(withAutoLayout: true)
        return scrollView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    // MARK: - Public methods

    public func configure(with viewData: ArticlePageViewData) {
        titleLabel.text = viewData.title
        descriptionLabel.attributedText = viewData.description

        if let image = viewData.image {
            configure(image: image)
        }

        if let externalUrl = viewData.externalUrl {
            configure(externalUrl: externalUrl)
        }
    }

    // MARK: - Private methods

    private func setup() {
        [
            titleLabel,
            descriptionLabel,
        ].forEach(contentStackView.addArrangedSubview(_:))

        scrollView.addSubview(contentStackView)
        addSubview(scrollView)

        scrollView.pin(to: self)
        contentStackView.pin(to: scrollView)

        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalTo: contentStackView.layoutMarginsGuide.widthAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: contentStackView.layoutMarginsGuide.widthAnchor),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])

    }

    private func configure(image: UIImage) {
        scrollView.delegate = self

        imageView.image = image
        imageHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: imageHeight)
        contentStackView.layer.cornerRadius = roundedCornerRadius
        scrollView.contentInset.top = imageHeight - roundedCornerRadius

        addSubview(imageView)
        sendSubviewToBack(imageView)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageHeightConstraint,
        ])
    }

    private func configure(externalUrl: SATSExternalUrlViewData) {
        contentStackView.addArrangedSubview(externalUrlView)
        externalUrlView.configure(withViewData: externalUrl)
    }

    private func updateImageSize() {
        let topInset = scrollView.contentInset.top
        let scrollOffset = -scrollView.contentOffset.y
        let additionalHeight = scrollOffset - topInset
        imageHeightConstraint.constant = imageHeight + max(0, additionalHeight)
    }
}

extension ArticlePageView: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateImageSize()
    }
}
