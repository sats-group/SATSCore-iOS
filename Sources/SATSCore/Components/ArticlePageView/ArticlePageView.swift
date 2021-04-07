import UIKit

public struct ArticlePageViewData {
    let title: String
    let description: NSAttributedString
    let image: UIImage?
    let externalUrlTitle: String?

    public init(
        title: String,
        description: NSAttributedString,
        image: UIImage?,
        externalUrlTitle: String?
    ) {
        self.title = title
        self.description = description
        self.image = image
        self.externalUrlTitle = externalUrlTitle
    }
}

public protocol ArticlePageViewDelegate: AnyObject {
    func articleViewDidSelectExternalUrl(_ view: ArticlePageView)
}

public class ArticlePageView: UIView {

    public lazy var topBar = TopBar(withAutoLayout: true)
    public weak var delegate: ArticlePageViewDelegate?

    // MARK: - Private

    private let roundedCornerRadius: CGFloat = 8
    private let headerHeight: CGFloat = 56
    private var hasImage: Bool { imageView.image != nil }
    private var imageHeight: CGFloat { 230 + safeAreaInsets.top }
    private lazy var imageHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: imageHeight)

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

    private lazy var externalUrlView: ExternalUrlView = {
        let view = ExternalUrlView(withAutoLayout: true)
        view.isHidden = true
        view.onOpenUrl = externalUrlTapped
        return view
    }()

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(withAutoLayout: true)
        stackView.backgroundColor = .backgroundSecondary
        stackView.axis = .vertical
        stackView.spacing = 25
        stackView.layoutMargins = UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(withAutoLayout: true)
        scrollView.delegate = self
        scrollView.contentInset.top = headerHeight
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
    public func configure(with viewData: ArticlePageViewData) {
        titleLabel.text = viewData.title
        descriptionLabel.attributedText = viewData.description

        topBar.configure(with: viewData.title)
        topBar.hideTitle()

        if let image = viewData.image {
            set(headerImage: image)
        }

        if let externalUrlTitle = viewData.externalUrlTitle {
            externalUrlView.configure(title: externalUrlTitle)
            externalUrlView.isHidden = false
        } else {
            externalUrlView.isHidden = true
        }
    }

    public func set(headerImage image: UIImage) {
        imageView.image = image

        contentStackView.layer.cornerRadius = roundedCornerRadius
        // here we make space for the content
        scrollView.contentInset.top = imageHeight - roundedCornerRadius

        topBar.set(style: .transparent)
    }
}

// MARK: - Private methods

extension ArticlePageView {
    private func setup() {
        [
            titleLabel,
            descriptionLabel,
            externalUrlView,
        ].forEach(contentStackView.addArrangedSubview(_:))

        scrollView.addSubview(contentStackView)

        [
            imageView,
            scrollView,
            topBar,
        ].forEach(addSubview(_:))

        scrollView.pin(to: self, includeSafeArea: true)
        contentStackView.pin(to: scrollView)

        NSLayoutConstraint.activate([
            topBar.topAnchor.constraint(equalTo: topAnchor),
            topBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            topBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            topBar.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),

            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageHeightConstraint,

            titleLabel.widthAnchor.constraint(equalTo: readableContentGuide.widthAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: readableContentGuide.widthAnchor),
            externalUrlView.widthAnchor.constraint(equalTo: readableContentGuide.widthAnchor),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }

    private func updateImageSize() {
        let topInset = scrollView.contentInset.top
        let scrollOffset = -scrollView.contentOffset.y
        let additionalHeight = scrollOffset - topInset
        imageHeightConstraint.constant = imageHeight + max(0, additionalHeight)
    }

    private func handleHeaderShift() {
        let headerShiftThreshold = scrollView.contentOffset.y + topBar.frame.size.height

        if headerShiftThreshold >= 0 {
            topBar.set(style: .solid, animated: true)
        } else {
            topBar.set(style: .transparent, animated: true)
        }
    }

    private func handleTitleShift() {
        if scrollView.contentOffset.y >= titleLabel.bounds.origin.y {
            topBar.showTitle(animated: true)
        } else if scrollView.contentOffset.y < titleLabel.bounds.origin.y {
            topBar.hideTitle(animated: true)
        }
    }

    private func externalUrlTapped() {
        delegate?.articleViewDidSelectExternalUrl(self)
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
