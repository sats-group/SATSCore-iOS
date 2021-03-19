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
    private let headerHeight: CGFloat = 56
    private var imageHeightConstraint = NSLayoutConstraint()
    private var hasImage: Bool { imageView.image != nil }
    private var imageHeight: CGFloat { 230 + safeAreaInsets.top }

    // MARK: - Views

    private lazy var headerView = SATSTopBar(withAutoLayout: true)

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
}

// MARK: - Public methods

extension ArticlePageView {
    public func configure(with viewData: ArticlePageViewData, dismissAction: Selector, isModal: Bool = false) {
        scrollView.delegate = self
        scrollView.contentInset.top = headerHeight

        titleLabel.text = viewData.title
        descriptionLabel.attributedText = viewData.description

        headerView.configure(with: viewData.title)
        headerView.hideTitle()
        if isModal {
            headerView.addRightButton(type: .close, action: dismissAction)
        } else {
            headerView.addLeftButton(type: .back, action: dismissAction)
        }

        if let image = viewData.image {
            configure(image: image)
        }

        if let externalUrl = viewData.externalUrl {
            configure(externalUrl: externalUrl)
        }
    }

    public func configure(image: UIImage) {
        imageView.image = image
        imageHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: imageHeight)
        contentStackView.layer.cornerRadius = roundedCornerRadius
        scrollView.contentInset.top = imageHeight - roundedCornerRadius
        headerView.setStyle(style: .transparent)

        addSubview(imageView)
        sendSubviewToBack(imageView)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageHeightConstraint,
        ])
    }
}

// MARK: - Private methods

extension ArticlePageView {
    private func setup() {
        [
            titleLabel,
            descriptionLabel,
        ].forEach(contentStackView.addArrangedSubview(_:))

        scrollView.addSubview(contentStackView)
        addSubview(scrollView)
        addSubview(headerView)

        scrollView.pin(to: self, includeSafeArea: true)
        contentStackView.pin(to: scrollView)

        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),

            titleLabel.widthAnchor.constraint(lessThanOrEqualTo: readableContentGuide.widthAnchor),
            descriptionLabel.widthAnchor.constraint(lessThanOrEqualTo: readableContentGuide.widthAnchor),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
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

    private func handleHeaderShift() {
        let headerShiftThreshold = scrollView.contentOffset.y + headerView.frame.size.height

        if headerShiftThreshold >= 0 {
            headerView.setStyle(style: .solid, animated: true)
        } else {
            headerView.setStyle(style: .transparent, animated: true)
        }
    }

    private func handleTitleShift() {
        if scrollView.contentOffset.y >= titleLabel.bounds.origin.y {
            headerView.showTitle(animated: true)
        } else if scrollView.contentOffset.y < titleLabel.bounds.origin.y {
            headerView.hideTitle(animated: true)
        }
    }
}

extension ArticlePageView: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if hasImage {
            updateImageSize()
            handleHeaderShift()
        }
        handleTitleShift()
    }
}
