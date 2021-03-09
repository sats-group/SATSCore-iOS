import UIKit

public struct SATSExternalUrlViewData {
    let title: String
    let url: String

    public init(title: String, url: String) {
        self.title = title
        self.url = url
    }
}

public class SATSExternalUrlView: UIView {

    // MARK: Private

    private var url: URL?

    // MARK: Views

    private lazy var wrapperStackView: UIStackView = {
        let stackView = UIStackView(withAutoLayout: true)
        stackView.axis = .horizontal
        stackView.layoutMargins = .init(vertical: 10, horizontal: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    private lazy var label: SATSLabel = {
        let label = SATSLabel(style: .basic)
        return label
    }()

    private lazy var iconView: UIImageView = {
        let imageView = UIImageView(withAutoLayout: true)
        imageView.image = .externalUrl
        imageView.tintColor = UIColor(red: 0.49, green: 0.57, blue: 0.68, alpha: 1) // IcoPositivePrimary
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

extension SATSExternalUrlView {
    private func setup() {
        [
            label,
            iconView,
        ].forEach { wrapperStackView.addArrangedSubview($0)}
        addSubview(wrapperStackView)

        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: 24),
            iconView.heightAnchor.constraint(equalToConstant: 24),
        ])

        wrapperStackView.pin(to: self)

        isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewDidTap(sender:)))
        addGestureRecognizer(tapGestureRecognizer)

        backgroundColor = .backgroundSecondary
    }

    @objc func viewDidTap(sender: UIView) {
        guard let url = url else { return }
        UIApplication.shared.open(url)
    }
}

// MARK: Public methods

extension SATSExternalUrlView {
    public func configure(withViewData viewData: SATSExternalUrlViewData) {
        url = URL(string: viewData.url)
        label.text = viewData.title
    }
}
