import UIKit

public class SATSButton: UIButton {

    // MARK: Initializers

    public init(style: Style, size: Size = .basic, withAutoLayout: Bool = true) {
        self.style = style
        self.size = size

        super.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = !withAutoLayout
        self.titleLabel?.adjustsFontForContentSizeCategory = true
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

    /// Specifies the spacing between the image and title.
    public var contentSpacing: CGFloat = 0 {
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

        layer.cornerRadius = bounds.height / 2
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

        titleLabel?.font = SATSFont.font(style: .button, weight: .emphasis)

        updateStyle()
        updateSize()
    }

    private func updateStyle() {
        backgroundColor = style.backgroundColor(forState: state)

        setTitleColor(style.titleColor, for: .normal)
        setTitleColor(style.titleColorDisabled, for: .disabled)
        loaderView.setLoaderColor(color: style.titleColor)
    }

    private func updateSize() {
        contentEdgeInsets = size.adjustContentInsets(with: contentSpacing)
        imageEdgeInsets = size.imageEdgeInsets
        titleEdgeInsets = UIEdgeInsets(vertical: 0, horizontal: contentSpacing)

        setContentHuggingPriority(size.contentHuggingPriority, for: .horizontal)
        setContentHuggingPriority(size.contentHuggingPriority, for: .vertical)
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
