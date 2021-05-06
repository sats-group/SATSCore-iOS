import UIKit

public struct ExternalUrlViewData {
    let title: String
    let url: URL

    public init(title: String, url: URL) {
        self.title = title
        self.url = url
    }
}

/// This is a visual button that used to render links to external URLs
public class ExternalUrlView: UIView {

    private var url: URL?

    public var onOpenUrl: ((_ url: URL?) -> Void)?

    // MARK: Views

    private lazy var wrapperStackView: UIStackView = {
        let stackView = UIStackView(withAutoLayout: true)
        stackView.axis = .horizontal
        stackView.layoutMargins = .init(vertical: 10, horizontal: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    private lazy var label = SATSLabel(style: .basic)

    private lazy var iconView: UIImageView = {
        let imageView = UIImageView(withAutoLayout: true)
        imageView.image = .linkExternal
        imageView.tintColor = .onSecondaryDisabled
        return imageView
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

// MARK: Private methods

extension ExternalUrlView {
    private func setup() {
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewDidTap(sender:))))

        [
            label,
            iconView,
        ].forEach(wrapperStackView.addArrangedSubview(_:))
        addSubview(wrapperStackView)

        iconView.fixed(size: 24)
        wrapperStackView.pin(to: self)
    }

    @objc func viewDidTap(sender: UIView) {
        onOpenUrl?(url)
    }
}

// MARK: Public methods

extension ExternalUrlView {
    public func configure(with viewData: ExternalUrlViewData) {
        label.text = viewData.title
        url = viewData.url
    }
}
