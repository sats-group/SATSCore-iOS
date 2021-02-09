import UIKit

public class SATSLabel: UILabel {
    let style: SATSFont.TextStyle
    let variant: SATSFont.FontVariation

    /// Encapsulation of the base text styling for UIKit
    /// - Parameters:
    ///   - style: the semantic style of a label, H1, H2, Large, etc
    ///   - variant: font variations: regular, emphasis, strong
    ///   - withAutoLayout: to determine if to use auto layout or not (default `true`)
    public init(style: SATSFont.TextStyle, variant: SATSFont.FontVariation = .default, withAutoLayout: Bool = true) {
        self.style = style
        self.variant = variant

        super.init(frame: .zero)

        self.font = SATSFont.font(style: style, variant: variant)
        self.textColor = .onBackgroundPrimary
        self.translatesAutoresizingMaskIntoConstraints = !withAutoLayout
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import SwiftUI

@available(iOS 14, *)
struct LabelExperiments_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Hello World")
        }
    }
}
