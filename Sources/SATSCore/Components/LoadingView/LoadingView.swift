import UIKit

/// Small view that adds a background and center an activity indicator
///
/// It's quite common we use a "full screen" view to show the loading state
/// So having a background where the loading indicator view lives is useful
public class LoadingView: UIView {
    // MARK: - Subviews

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(withAutoLayout: true)
        activityIndicator.style = .medium
        return activityIndicator
    }()

    // MARK: - Initializers

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    // MARK: - Internal methods

    public func startAnimating() {
        activityIndicator.startAnimating()
    }

    public func stopAnimating() {
        activityIndicator.stopAnimating()
    }

    public func setSpinnerColor(color: UIColor) {
        activityIndicator.color = color
    }

    // MARK: - Private methods

    private func setup() {
        addSubview(activityIndicator)
        activityIndicator.center(in: self)
        startAnimating()
    }
}
