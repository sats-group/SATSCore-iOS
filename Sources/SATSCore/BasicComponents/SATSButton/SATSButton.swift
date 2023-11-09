import UIKit

#if os(iOS)
public class SATSButton: UIButton {
    // MARK: Initializers

    public init(style: Style, size: Size = .basic, withAutoLayout: Bool = true) {
        self.style = style
        self.size = size

        super.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = !withAutoLayout
        titleLabel?.adjustsFontForContentSizeCategory = true
        setup()
    }

    public required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: Public properties

    public var style: Style {
        didSet { updateStyle() }
    }

    public var size: Size {
        didSet { updateSize() }
    }

    // MARK: UIButton overrides

    public override var isHighlighted: Bool {
        didSet {
            backgroundColor = style.backgroundColor(forState: state)
        }
    }

    public override var isEnabled: Bool {
        didSet {
            backgroundColor = style.backgroundColor(forState: state)
        }
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = .cornerRadiusS
    }

    public override func setTitle(_ title: String?, for state: UIControl.State) {
        if let title {
            var titleContainer = AttributeContainer()
            titleContainer.font = SATSFont.font(style: .button, weight: .emphasis)
            configuration?.attributedTitle = AttributedString(title, attributes: titleContainer)
        } else {
            super.setTitle(title, for: state)
        }
    }

    // MARK: Views

    private lazy var loaderView: RoundLoadingView = {
        let spinnerView = RoundLoadingView(withAutoLayout: true)
        spinnerView.alpha = 0
        return spinnerView
    }()

    // MARK: Private methods

    private func setup() {
        clipsToBounds = true

        self.configuration = styleConfiguration()
        updateSize()
        updateStyle()
    }

    private func updateStyle() {
        guard var background = configuration?.background else { return }

        background.strokeColor = style.borderColor
        background.strokeWidth = style.borderColor != nil ? 1 : 0
        background.cornerRadius = .cornerRadiusS

        configuration?.background = background
        configuration?.baseBackgroundColor = style.backgroundColor
        configuration?.baseForegroundColor = style.titleColor

        loaderView.setLoaderColor(color: style.titleColor)
    }

    private func updateSize() {
        configuration?.buttonSize = size == .large ? .large : .medium

        configuration?.imagePadding = size.imagePaddding
        configuration?.titlePadding = 0
        configuration?.contentInsets = size.contentEdgeInsets

        setContentHuggingPriority(size.contentHuggingPriority, for: .horizontal)
        setContentHuggingPriority(size.contentHuggingPriority, for: .vertical)
    }

    private func styleConfiguration() -> UIButton.Configuration {
        switch style {
        case .tertiary: .plain()
        case .secondary: .bordered()
        default: .filled()
        }
    }

    // MARK: Public methods

    public func startLoader() {
        guard !subviews.contains(loaderView) else { return }

        addSubview(loaderView)
        isUserInteractionEnabled = false
        titleLabel?.alpha = 0
        imageView?.alpha = 0
        loaderView.center(in: self)
        loaderView.fixed(size: 20)
        loaderView.alpha = 1
        loaderView.startAnimating()
    }

    public func stopLoader() {
        guard subviews.contains(loaderView) else { return }

        isUserInteractionEnabled = true
        loaderView.stopAnimating()
        loaderView.removeFromSuperview()
        titleLabel?.alpha = 1
        imageView?.alpha = 1
    }
}
#endif
