import UIKit

public extension UIView {
    /// Makes a 1pt line view that you can use as separator
    /// the position and width of this separator must be handled with the view that calls this method
    func horizontalSeparatorView() -> UIView {
        let separatorView = UIView(withAutoLayout: true)
        separatorView.backgroundColor = .border

        NSLayoutConstraint.activate([
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            // we set a minimum width as to avoid invoking this method and not seeing it
            // as the view by default would have width equal to 0
            separatorView.widthAnchor.constraint(greaterThanOrEqualToConstant: 20),
        ])

        return separatorView
    }

    /// Makes a 1pt line view that you can use as separator
    /// the position and width of this separator must be handled with the view that calls this method
    func verticalSeparatorView() -> UIView {
        let separatorView = UIView(withAutoLayout: true)
        separatorView.backgroundColor = .border

        NSLayoutConstraint.activate([
            separatorView.widthAnchor.constraint(equalToConstant: 1),
            // we set a minimum width as to avoid invoking this method and not seeing it
            // as the view by default would have width equal to 0
            separatorView.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
        ])

        return separatorView
    }
}
