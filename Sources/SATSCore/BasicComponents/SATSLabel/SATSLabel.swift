import UIKit

public class SATSLabel: UILabel {
    let style: SATSFont.TextStyle
    let weight: SATSFont.Weight

    /// Encapsulation of the base text styling for UIKit
    /// - Parameters:
    ///   - style: the semantic style of a label, H1, H2, Large, etc
    ///   - weight: font variations: regular, emphasis, strong
    ///   - withAutoLayout: to determine if to use auto layout or not (default `true`)
    public init(style: SATSFont.TextStyle, weight: SATSFont.Weight = .default, withAutoLayout: Bool = true) {
        self.style = style
        self.weight = weight

        super.init(frame: .zero)

        self.font = SATSFont.font(style: style, weight: weight)
        self.textColor = .onBackgroundPrimary
        self.translatesAutoresizingMaskIntoConstraints = !withAutoLayout
        self.adjustsFontForContentSizeCategory = true
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
