import UIKit

public class SATSLabel: UILabel {
    private var _style: TextStyle
    private var _text: String?

    // MARK: - Initializers

    public init(_ type: TextType = .basic, color colorType: TextColorType? = nil, text: String? = nil) {
        self.type = type
        _style = TextType.styles[type] ?? TextStyle()
        if let colorType = colorType { _style.colorType = colorType }

        super.init(frame: .zero)

        _applyStyle()
        _setText(text)

        translatesAutoresizingMaskIntoConstraints = false
        lineBreakMode = .byWordWrapping
    }

    public convenience init(_ text: String? = nil) {
        self.init(.basic, text: text)
    }

    public required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func _applyStyle() {
        textColor = _style.color
        font = _style.font
    }

    private func _setText(_ value: String? = nil) {
        _text = value
        guard var value = value else {
            super.text = _text
            return
        }

        if _style.forceUppercase {
            value = value.uppercased()
        }

        if _style.isUnderlined || lineHeight != nil {
            var attributes = [NSAttributedString.Key: Any]()
            if _style.isUnderlined {
                attributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
            }
            if let lineHeight = self.lineHeight {
                attributes[.paragraphStyle] = NSMutableParagraphStyle().with(lineHeight: lineHeight)
            }
            self.attributedText = NSMutableAttributedString(string: value, attributes: attributes)
        } else {
            super.text = value
        }
    }

    // MARK: - Properties

    public var type: TextType {
        didSet {
            _style = TextType.styles[type] ?? TextStyle()
            _applyStyle()
        }
    }

    public override var text: String? {
        get { _text }
        set { _setText(newValue) }
    }

    @discardableResult
    public func text(_ value: String?) -> Self {
        _setText(value)
        return self
    }

    // MARK: - Style overrides

    public var lineHeight: CGFloat? {
        get { _style.lineHeight }
        set {
            _style.lineHeight = newValue
            _setText(self.text)
        }
    }

    @discardableResult
    public func lineHeight(_ value: CGFloat) -> Self {
        _style.lineHeight = value
        _setText()
        return self
    }

    public var lineHeightMultiple: CGFloat? {
        get { _style.lineHeightMultiple }
        set {
            _style.lineHeightMultiple = newValue
            _setText(self.text)
        }
    }

    @discardableResult
    public func lineHeightMultiple(_ value: CGFloat) -> Self {
        _style.lineHeightMultiple = value
        _setText()
        return self
    }

    public var textColorType: TextColorType {
        get { return _style.colorType }
        set {
            _style.colorType = newValue
            textColor = _style.color
        }
    }

    @discardableResult
    public func textColorType(_ colorType: TextColorType) -> Self {
        _style.colorType = colorType
        textColor = _style.color
        return self
    }

    @discardableResult
    public func isMonospacedDigit(_ value: Bool = true) -> Self {
        _style.isMonospacedDigit = value
        font = _style.font
        return self
    }

    @discardableResult
    public func isItalic(_ value: Bool = true) -> Self {
        _style.isItalic = value
        font = _style.font
        return self
    }

    @discardableResult
    public func isBold(_ value: Bool = true) -> Self {
        _style.fontWeight = (value ? .semibold : .regular)
        font = _style.font
        return self
    }

    @discardableResult
    public func isUnderlined(_ value: Bool = true) -> Self {
        _style.isUnderlined = value
        _setText(_text)
        return self
    }

    // MARK: - Lines and alignment

    @discardableResult
    public func lineLimit(_ numberOfLines: Int) -> Self {
        self.numberOfLines = numberOfLines
        return self
    }

    @discardableResult
    public func alignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        return self
    }

    @discardableResult
    public func lineBreakMode(_ mode: NSLineBreakMode) -> Self {
        UILabel().lineBreakMode = mode
        return self
    }

    // MARK: - Padding support

    public var padding: UIEdgeInsets = .zero { didSet { setNeedsLayout() }}

    @discardableResult
    public func padding(_ insets: UIEdgeInsets) -> Self {
        padding = insets
        return self
    }

    // MARK: - UILabel overrides

    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    public override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + padding.left + padding.right,
                      height: size.height + padding.top + padding.bottom)
    }

    public override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (padding.left + padding.right)
        }
    }
}
