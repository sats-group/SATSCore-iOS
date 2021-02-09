import UIKit

public class SATSButton: UIButton {

    // MARK: Initializers

    public init(style: Style, size: Size = .regular, withAutoLayout: Bool = true) {
        self.style = style
        self.size = size

        super.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = !withAutoLayout
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

    // MARK: Private methods

    private func setup() {
        clipsToBounds = true

        titleLabel?.font = SATSFont.font(style: .button, variant: .emphasis)

        updateStyle()
        updateSize()
    }

    private func updateStyle() {
        backgroundColor = style.backgroundColor(forState: state)

        setTitleColor(style.titleColor, for: .normal)
        setTitleColor(style.titleColorDisabled, for: .disabled)
    }

    private func updateSize() {
        contentEdgeInsets = size.adjustContentInsets(with: contentSpacing)
        imageEdgeInsets = size.imageEdgeInsets
        titleEdgeInsets = UIEdgeInsets(top: 0, left: contentSpacing, bottom: 0, right: -contentSpacing)

        setContentHuggingPriority(size.contentHuggingPriority, for: .horizontal)
        setContentHuggingPriority(size.contentHuggingPriority, for: .vertical)
    }
}
