import UIKit

/// Implements a semi-translucent fog aka gradient for the ProfileTrainingGraphCell
public class GradientView: UIView {
    public var colors: [UIColor] = [] {
        didSet { updateColors() }
    }

    public var startPoint: CGPoint {
        get { gradientLayer.startPoint }
        set { gradientLayer.startPoint = newValue }
    }

    public var endPoint: CGPoint {
        get { gradientLayer.endPoint }
        set { gradientLayer.endPoint = newValue }
    }

    public var locations: [NSNumber]? {
        get { gradientLayer.locations }
        set { gradientLayer.locations = newValue }
    }

    public var gradientLayer: CAGradientLayer {
        guard let layer = self.layer as? CAGradientLayer else {
            preconditionFailure()
        }
        return layer
    }

    public override class var layerClass: AnyClass {
        CAGradientLayer.self
    }

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
    }

    private func updateColors() {
        gradientLayer.colors = colors.map { $0.cgColor }
    }

    /// The colors used in the gradient are CGcolors,
    /// this means they are eagerly evaluated, then we need to
    /// observe the theme changed to update the colors accordingly
    private var themeObservation: NSObjectProtocol?

    public override init(frame: CGRect) {
        super.init(frame: frame)

        themeObservation = NotificationCenter
            .default
            .addObserver(forName: ColorTheme.themeChangedNotification, object: nil, queue: .main) { [weak self] _ in
                self?.updateColors()
            }
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
