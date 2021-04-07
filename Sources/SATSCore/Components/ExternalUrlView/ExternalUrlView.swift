import UIKit

/// This is a visual button that used to render links to external URLs
///
/// it only requires a title for configuration, as when the button is pressed, we use the `onOpenUrl`
/// callback, which should handle the logic of actually opening an external web page.
/// Then this button doesn't require any knowledge of the URL.
public class ExternalUrlView: UIView {

    public var onOpenUrl: (() -> Void)?

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
        imageView.tintColor = .onBackgroundPrimary
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
        onOpenUrl?()
    }
}

// MARK: Public methods

extension ExternalUrlView {
    public func configure(title: String) {
        label.text = title
    }
}
