import UIKit

public class SATSLabel: UILabel {
    let style: SATSFont.TextStyle
    let variant: SATSFont.FontVariation

    public init(style: SATSFont.TextStyle, variant: SATSFont.FontVariation = .default, withAutoLayout: Bool = false) {
        self.style = style
        self.variant = variant

        super.init(frame: .zero)

        self.font = SATSFont.font(style: style, variant: variant)
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
