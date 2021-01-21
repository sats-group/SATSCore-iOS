import UIKit

class SpinnerActivityIndicator: UIView {
    private var progressLayer = CAShapeLayer()
    private var trackLayer = CAShapeLayer()
    private var isAnimating = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    var animationDuration: TimeInterval = 2

    var progressColor: UIColor = UIColor.white {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }

    var trackColor: UIColor = UIColor.white.withAlphaComponent(0.1) {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }

    private func setup() {
        createCircularPath()

        layer.addSublayer(trackLayer)
        layer.addSublayer(progressLayer)
    }

    private func createCircularPath() {
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.frame.size.width / 2.0

        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0),
            radius: (frame.size.width - 1.5) / 2,
            startAngle: CGFloat(-0.5 * Double.pi),
            endAngle: CGFloat(1.5 * Double.pi),
            clockwise: true)

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

    func startAnimating() {
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

    func stopAnimating() {
        guard isAnimating else { return }
        progressLayer.removeAllAnimations()
        isAnimating = false
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        createCircularPath()
    }
}
