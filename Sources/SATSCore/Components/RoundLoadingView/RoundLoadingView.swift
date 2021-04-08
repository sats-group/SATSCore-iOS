import UIKit

public class RoundLoadingView: UIView {

    // MARK: Private properties

    private var progressLayer = CAShapeLayer()
    private var trackLayer = CAShapeLayer()
    private var isAnimating = false

    private var progressColor: UIColor = .onPrimary {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }

    private var trackColor: UIColor = UIColor.onPrimary.withAlphaComponent(0.1) {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }

    // MARK: Public properties

    public var animationDuration: TimeInterval = 2

    // MARK: Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Lifecycle

    public override func layoutSubviews() {
        super.layoutSubviews()
        createCircularPath()
    }

    // MARK: Private methods

    private func setup() {
        createCircularPath()

        layer.addSublayer(trackLayer)
        layer.addSublayer(progressLayer)
    }

    private func createCircularPath() {
        backgroundColor = UIColor.clear
        layer.cornerRadius = frame.size.width / 2.0

        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0),
            radius: (frame.size.width - 1.5) / 2,
            startAngle: CGFloat(-0.5 * Double.pi),
            endAngle: CGFloat(1.5 * Double.pi),
            clockwise: true
        )

        trackLayer.path = circlePath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.lineWidth = 2.0
        trackLayer.strokeEnd = 1.0

        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.lineWidth = 2.0
        progressLayer.strokeEnd = 0.0
    }

    // MARK: Public methods

    public func startAnimating() {
        guard !isAnimating else { return }
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = animationDuration
        animation.fromValue = 0
        animation.toValue = 1
        animation.repeatCount = .infinity
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        progressLayer.strokeEnd = CGFloat(1)
        progressLayer.add(animation, forKey: "animationCircle")
        isAnimating = true
    }

    public func stopAnimating() {
        guard isAnimating else { return }
        progressLayer.removeAllAnimations()
        isAnimating = false
    }

    public func setLoaderColor(color: UIColor) {
        progressColor = color
        trackColor = color.withAlphaComponent(0.1)
    }
}
