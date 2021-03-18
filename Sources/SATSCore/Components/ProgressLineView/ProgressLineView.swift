import UIKit

public class ProgressLineView: UIView {

    // MARK: Private properties

    private lazy var progressView: UIView = {
        let view = UIView(withAutoLayout: true)
        view.backgroundColor = .primary
        return view
    }()

    // We keep a reference to the width constraint as when we call the
    // `configure` method we recreate the constraint as it's not possible
    // to modify a constraint's multiplier. Then we keep this reference
    // to invalidate old constraints we will recreate
    private var widthConstraint: NSLayoutConstraint? {
        willSet {
            widthConstraint?.isActive = false
        }
        didSet {
            widthConstraint?.isActive = true
        }
    }

    // MARK: Initializers

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    // MARK: Internal methods

    public func configure(percentage: CGFloat) {
        assert(0 <= percentage && percentage <= 1.0)
        widthConstraint = progressView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: percentage)
    }

    // MARK: Private methods

    private func setup() {
        backgroundColor = Self.emptyColor
        clipsToBounds = true
        layer.cornerRadius = Self.height / 2.0

        addSubview(progressView)

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Self.height),
            widthAnchor.constraint(greaterThanOrEqualToConstant: Self.minWidth),

            progressView.heightAnchor.constraint(equalToConstant: Self.height),
            progressView.centerYAnchor.constraint(equalTo: centerYAnchor),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
        ])

        widthConstraint = progressView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.0)
    }

    // MARK: Private constants

    private static let minWidth: CGFloat = 200
    private static let height: CGFloat = 8
    private static let emptyColor = #colorLiteral(red: 0.8665804267, green: 0.8904739618, blue: 0.9205796123, alpha: 1)
}
