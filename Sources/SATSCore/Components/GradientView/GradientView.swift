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
}
