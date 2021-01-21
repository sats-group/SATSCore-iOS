import UIKit

/// A subclass of a button where we could be adding any SATS-specific functionality needed throughout the app
public class BaseButton: UIButton {
    /// Normally UIButton adds a small padding on top and bottom of its titleLabel.
    /// Setting this property to true removes padding making the button occupy exactly the
    /// space needed for the titleLabel.
    /// See https://stackoverflow.com/questions/31873049/how-to-remove-the-top-and-bottom-padding-of-uibutton-when-create-it-using-auto
    var shouldTightenMarginsAroundTitleLabel: Bool = false

    public override var intrinsicContentSize: CGSize {
        guard shouldTightenMarginsAroundTitleLabel else {
            return super.intrinsicContentSize
        }
        return titleLabel?.intrinsicContentSize ?? super.intrinsicContentSize
    }

    /// By default when the UIButton is disabled it becomes transparent to touches propagating touch events to a view underneath.
    /// Setting this property to true makes it capture touch events even in the disabled state.
    var shouldCaptureTouchInDisabledState: Bool = false

    public override func hitTest(_ pt: CGPoint, with event: UIEvent?) -> UIView? {
        if shouldCaptureTouchInDisabledState && point(inside: pt, with: event) {
            return self
        }
        return super.hitTest(pt, with: event)
    }
}

/// A button shaped as a circle.
public class RoundedButton: BaseButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        clipsToBounds = true
        titleLabel?.font = TextType.button.style.font
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = bounds.height / 2
    }
}

import UIKit

class SATSButton: RoundedButton {
    /// Specifies a visual theme of the button
    enum DisplayStyle {
        case positiveMain
        case negativeMain
        case positiveSecondary
        case negativeSecondary
        case error
    }

    /// Specifies visual representation / a theme of the button, what it should look like.
    var displayStyle: DisplayStyle = .positiveMain {
        didSet {
            updateDisplayStyle()
        }
    }

    /// Specifies a resizing behaviour of the button
    enum LayoutStyle {
        /// Tall primary button, can grow horizontally.
        case large
        /// Small height but allowed to grow horizontally.
        case regular
        /// Compact button that hugs its title as much as possible.
        case compact
    }

    /// Specifiec a resizing behaviour of the button, whether it is allowed to grow or hugs its title.
    var layoutStyle: LayoutStyle = .large {
        didSet {
            updateLayoutStyle()
        }
    }

    /// Specifies the spacing between the image and title.
    var contentSpacing: CGFloat = 0 {
        didSet {
            updateLayoutStyle()
        }
    }

    private lazy var loaderView: SpinnerActivityIndicator = {
        let spinnerView = SpinnerActivityIndicator()
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        spinnerView.alpha = 0
        return spinnerView
    }()

    func showLoader(userInteraction: Bool = false) {
        guard !subviews.contains(loaderView) else { return }

        addSubview(loaderView)
        isUserInteractionEnabled = userInteraction
        titleLabel?.alpha = 0
        imageView?.alpha = 0
        setupLoaderLayoutConstraints()
        loaderView.alpha = 1
        loaderView.startAnimating()
    }

    func hideLoader() {
        guard subviews.contains(loaderView) else { return }

        isUserInteractionEnabled = true
        loaderView.stopAnimating()
        loaderView.removeFromSuperview()
        titleLabel?.alpha = 1
        imageView?.alpha = 1
    }

    override func setup() {
        super.setup()

        shouldCaptureTouchInDisabledState = true
        titleLabel?.font = TextType.button.style.font
        setTitleColor(ColorTheme.Brand.primary.color, for: .normal)

        let backgroundColor = ColorTheme.Brand.primaryLight.color.withAlphaComponent(0.1)
        setBackgroundImage(UIImage.solid(color: backgroundColor), for: .normal)

        contentEdgeInsets = UIEdgeInsets(top: 10, left: 19, bottom: 10, right: 19)

        setContentHuggingPriority(.defaultHigh, for: .horizontal)
        setContentHuggingPriority(.defaultHigh, for: .vertical)
    }

    private func setupLoaderLayoutConstraints() {
        let diameter = frame.height / 2
        NSLayoutConstraint.activate([
            loaderView.heightAnchor.constraint(equalToConstant: diameter),
            loaderView.widthAnchor.constraint(equalToConstant: diameter),
            loaderView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loaderView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    private func updateDisplayStyle() {
        switch displayStyle {
        case .positiveMain:
            setTitleColor(ColorTheme.TypoNegative.primary.color, for: .normal)
            setTitleColor(ColorTheme.TypoPositive.off.color, for: .disabled)

            setBackgroundImage(UIImage.solid(color: ColorTheme.ButtonPositive.mainEnabled.color), for: .normal)
            setBackgroundImage(UIImage.solid(color: ColorTheme.ButtonPositive.mainPressed.color), for: .highlighted)
            setBackgroundImage(UIImage.solid(color: ColorTheme.ButtonPositive.mainDisabled.color), for: .disabled)

        case .negativeMain:
            setTitleColor(ColorTheme.TypoPositive.primary.color, for: .normal)
            setTitleColor(ColorTheme.TypoPositive.off.color, for: .disabled)

            setBackgroundImage(UIImage.solid(color: ColorTheme.ButtonNegative.mainEnabled.color), for: .normal)
            setBackgroundImage(UIImage.solid(color: ColorTheme.ButtonNegative.mainPressed.color), for: .highlighted)
            setBackgroundImage(UIImage.solid(color: ColorTheme.ButtonNegative.mainDisabled.color), for: .disabled)

        case .positiveSecondary:
            setTitleColor(ColorTheme.TypoPositive.primary.color, for: .normal)
            setTitleColor(ColorTheme.TypoPositive.off.color, for: .disabled)

            setBackgroundImage(UIImage.solid(color: ColorTheme.ButtonPositive.secondaryEnabled.color), for: .normal)
            setBackgroundImage(
                UIImage.solid(color: ColorTheme.ButtonPositive.secondaryPressed.color),
                for: .highlighted
            )
            setBackgroundImage(UIImage.solid(color: ColorTheme.ButtonPositive.secondaryDisabled.color), for: .disabled)

        case .negativeSecondary:
            setTitleColor(ColorTheme.TypoNegative.primary.color, for: .normal)
            setTitleColor(ColorTheme.TypoNegative.off.color, for: .disabled)

            setBackgroundImage(UIImage.solid(color: ColorTheme.ButtonNegative.secondaryEnabled.color), for: .normal)
            setBackgroundImage(
                UIImage.solid(color: ColorTheme.ButtonNegative.secondaryPressed.color),
                for: .highlighted
            )
            setBackgroundImage(UIImage.solid(color: ColorTheme.ButtonNegative.secondaryDisabled.color), for: .disabled)
        case .error:
            let backgroundColor = ColorTheme.SignalPositive.error.color
            let textColor = UIColor.white

            setBackgroundImage(UIImage.solid(color: backgroundColor), for: .normal)
            setTitleColor(textColor, for: .normal)
        }
    }

    private func updateLayoutStyle() {
        switch layoutStyle {
        case .large:
            contentEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20 + contentSpacing)
            setContentHuggingPriority(.defaultLow, for: .horizontal)
            setContentHuggingPriority(.defaultLow, for: .vertical)
        case .regular:
            contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16 + contentSpacing)
            setContentHuggingPriority(.defaultLow, for: .horizontal)
            setContentHuggingPriority(.defaultLow, for: .vertical)
        case .compact:
            contentEdgeInsets = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20 + contentSpacing)
            setContentHuggingPriority(.defaultHigh, for: .horizontal)
            setContentHuggingPriority(.defaultHigh, for: .vertical)
        }
        imageEdgeInsets = .zero
        titleEdgeInsets = UIEdgeInsets(top: 0, left: contentSpacing, bottom: 0, right: -contentSpacing)
    }
}
