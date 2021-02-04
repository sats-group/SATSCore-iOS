import SwiftUI

public class SATSButton: UIButton {

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: UIButton overrides

    public override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = bounds.height / 2
    }

    // MARK: Private methods

    private func setup() {
        clipsToBounds = true
    }
}

public extension SATSButton {
    /// Specifies a visual theme of the button
    struct DisplayStyle {
        // titleColor - normal
        // titleColor - disabled

        // backgroundImage - solidColor - normal
        // backgroundImage - solidColor - highlighted
        // backgroundImage - solidColor - disabled
    }

    /// Specifies a resizing behaviour of the button
    struct LayoutStyle {
        // contentEdgeInsets
        // contentHugging
        // imageEdgeInsets
        // titleEdgeInsets
    }
}

public extension SATSButton.DisplayStyle {
    static let positiveMain = SATSButton.DisplayStyle()

    static let negativeMain = SATSButton.DisplayStyle()

    static let positiveSecondary = SATSButton.DisplayStyle()

    static let negativeSecondary = SATSButton.DisplayStyle()

    static let error = SATSButton.DisplayStyle()
}

public extension SATSButton.LayoutStyle {
    /// Tall primary button, can grow horizontally.
    static let large = SATSButton.LayoutStyle()

    /// Small height but allowed to grow horizontally.
    static let regular = SATSButton.LayoutStyle()

    /// Compact button that hugs its title as much as possible.
    static let compact = SATSButton.LayoutStyle()
}

struct SATSButtonDemoView: View {
    var body: some View {
        VStack {
            Text("Hello")
        }
        .navigationTitle("SATSButton")
    }
}

struct SATSButtonDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SATSButtonDemoView()
        }
    }
}
