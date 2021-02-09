import SwiftUI
import UIKit

class SampleView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private lazy var headerView: HeaderView = HeaderView(withAutoLayout: true)

    private lazy var contentView: UIView = {
        let label = SATSLabel(style: .large, withAutoLayout: true)
        label.text = "Hello World"
        label.textColor = .onBackgroundPrimary

        let view = UIView(withAutoLayout: true)

        view.addSubview(label)
        label.center(in: view)

        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(withAutoLayout: true)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private func setup() {
        backgroundColor = .backgroundPrimary

        [
            headerView,
            contentView,
        ].forEach(stackView.addArrangedSubview(_:))

        addSubview(stackView)
        stackView.pin(to: self)
    }
}

extension SampleView {
    class HeaderView: UIView {
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }

        required init?(coder: NSCoder) {
            fatalError()
        }

        private lazy var title: SATSLabel = {
            let label = SATSLabel(style: .h1, variant: .satsFeeling, withAutoLayout: true)
            label.text = "SATS".uppercased()
            label.textColor = .onButtonPrimary
            return label
        }()

        private lazy var stackView: UIStackView = {
            let stackView = UIStackView(withAutoLayout: true)
            stackView.axis = .vertical
            return stackView
        }()

        private lazy var sections: UIStackView = {
            let stackView = UIStackView(withAutoLayout: true)
            stackView.axis = .horizontal
            return stackView
        }()

        private func setup() {
            backgroundColor = .backgroundTopStart

            [
                "Discover",
                "Following",
                "Clubs",
                "Online Training",
            ].forEach { text in
                let label = SATSLabel(style: .large, withAutoLayout: true)
                label.textColor = .onButtonPrimary
                sections.addArrangedSubview(label)
            }

            [
                title,
                sections
            ].forEach(stackView.addArrangedSubview(_:))

            addSubview(stackView)
            stackView.pin(to: self)
        }
    }
}

struct UIKitDemoView: View {
    var body: some View {
        DemoWrapperView(view: SampleView())
    }
}

struct UIKitDemoView_Previews: PreviewProvider {
    static var previews: some View {
        UIKitDemoView()
    }
}
