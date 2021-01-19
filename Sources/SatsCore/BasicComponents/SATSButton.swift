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

    var isLoading: Bool = false
    private lazy var loaderView: SpinnerActivityIndicator = {
        let spinnerView = SpinnerActivityIndicator()
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        spinnerView.alpha = 0
        return spinnerView
    }()

    func showLoader(userInteraction: Bool = false, _ completion: (() -> Void)? = nil) {
        guard !self.subviews.contains(loaderView) else { return }
        addSubview(loaderView)

        isLoading = true
        self.isUserInteractionEnabled = userInteraction
        UIView.transition(with: self, duration: 0.2, options: .curveEaseOut, animations: {
            self.titleLabel?.alpha = 0
            self.imageView?.alpha = 0
            self.setupLoaderLayoutConstraints()
            self.loaderView.alpha = 1
        }) { [weak self] _ in
            guard let self = self else { return }
            if self.isLoading {
                self.loaderView.startAnimating()
            } else {
                self.hideLoader(completion)
            }
            completion?()
        }
    }

    func hideLoader(_ completion: (() -> Void)? = nil) {
        guard self.subviews.contains(loaderView) else { return }
        isLoading = false
        self.isUserInteractionEnabled = true
        loaderView.stopAnimating()
        loaderView.removeFromSuperview()
        UIView.transition(with: self, duration: 0.2, options: .curveEaseIn, animations: {
            self.titleLabel?.alpha = 1
            self.imageView?.alpha = 1
        }) { _ in
            completion?()
        }
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
            setBackgroundImage(UIImage.solid(color: ColorTheme.ButtonPositive.secondaryPressed.color), for: .highlighted)
            setBackgroundImage(UIImage.solid(color: ColorTheme.ButtonPositive.secondaryDisabled.color), for: .disabled)

        case .negativeSecondary:
            setTitleColor(ColorTheme.TypoNegative.primary.color, for: .normal)
            setTitleColor(ColorTheme.TypoNegative.off.color, for: .disabled)

            setBackgroundImage(UIImage.solid(color: ColorTheme.ButtonNegative.secondaryEnabled.color), for: .normal)
            setBackgroundImage(UIImage.solid(color: ColorTheme.ButtonNegative.secondaryPressed.color), for: .highlighted)
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

#if DEBUG && canImport(SwiftUI)
import SwiftUI

class SATSButtonPreviewViewController: UIViewController {
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func make(_ title: String,
              displayStyle: SATSButton.DisplayStyle,
              layoutStyle: SATSButton.LayoutStyle) -> SATSButton {
        let button = SATSButton()
        button.setTitle(title, for: .normal)
        button.displayStyle = displayStyle
        button.layoutStyle = layoutStyle
        return button
    }

    func make(_ title: String,
              image: UIImage,
              displayStyle: SATSButton.DisplayStyle,
              layoutStyle: SATSButton.LayoutStyle) -> SATSButton {

        let button = SATSButton()
        button.displayStyle = displayStyle
        button.layoutStyle = layoutStyle
        button.setTitle(title, for: .normal)
        button.setImage(image, for: .normal)
        button.contentSpacing = 20
        return button
    }

    private func setup() {
        view.backgroundColor = UIColor(white: 0.8, alpha: 1)
        [
            make(
                "PositiveMain / Compact",
                image: UIImage(named: "cog")!,
                displayStyle: .positiveMain,
                layoutStyle: .compact
            ),
            make("PositiveMain / Large", displayStyle: .positiveMain, layoutStyle: .large),
            make("PositiveMain / Regular", displayStyle: .positiveMain, layoutStyle: .regular),
            make("PositiveSecondary / Compact", displayStyle: .positiveSecondary, layoutStyle: .compact),

            make("NegativeMain / Large", displayStyle: .negativeMain, layoutStyle: .large),
            make("NegativeSecondary / Compact", displayStyle: .negativeSecondary, layoutStyle: .compact),

            make("Error / Large", displayStyle: .error, layoutStyle: .large),
        ].forEach(stackView.addArrangedSubview(_:))

        [
            stackView,
        ].forEach(view.addSubview(_:))

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

@available(iOS 13.0, *)
struct SATSButtonPreviewer: UIViewControllerRepresentable {
    typealias UIViewControllerType = SATSButtonPreviewViewController

    func makeUIViewController(
        context: UIViewControllerRepresentableContext<SATSButtonPreviewer>
    ) -> SATSButtonPreviewer.UIViewControllerType {
        return SATSButtonPreviewViewController()
    }

    func updateUIViewController(
        _ uiViewController: SATSButtonPreviewViewController,
        context: UIViewControllerRepresentableContext<SATSButtonPreviewer>
    ) { }
}

@available(iOS 13, *)
struct SATSButtonPreviewViewController_Previews: PreviewProvider {
    static var previews: some View {
        SATSButtonPreviewer()
    }
    
    static var platform: PreviewPlatform? = .iOS
}
#endif
