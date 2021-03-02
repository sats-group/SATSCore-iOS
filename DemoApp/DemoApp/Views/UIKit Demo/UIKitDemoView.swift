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

    private lazy var button: SATSButton = {
        let button = SATSButton(style: .primary, size: .compact, withAutoLayout: true)
        button.setTitle("Push me!", for: .normal)
        return button
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
            button,
            contentView,
        ].forEach(stackView.addArrangedSubview(_:))

        addSubview(stackView)
        stackView.pin(to: self, preserveMargins: true)
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
            let label = SATSLabel(style: .h1, weight: .satsFeeling, withAutoLayout: true)
            label.text = "SATS".uppercased()
            label.textColor = .onPrimary
            return label
        }()

        private lazy var stackView: UIStackView = {
            let stackView = UIStackView(withAutoLayout: true)
            stackView.axis = .vertical
            stackView.spacing = 8
            stackView.isLayoutMarginsRelativeArrangement = true
            return stackView
        }()

        private lazy var sections: UIStackView = {
            let stackView = UIStackView(withAutoLayout: true)
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            return stackView
        }()

        private func setup() {
            backgroundColor = .backgroundTopStart
            layoutMargins = UIEdgeInsets(all: 20)

            [
                "Discover",
                "Following",
                "Clubs",
                "Online Training",
            ].forEach { text in
                let label = SATSLabel(style: .large)
                label.textColor = .onPrimary
                label.text = text
                label.textAlignment = .center

                let containerView = UIView(withAutoLayout: true)
                containerView.layoutMargins = UIEdgeInsets(all: 8)
                containerView.addSubview(label)
                label.pin(to: containerView, preserveMargins: true)

                if text == "Discover" {
                    let activeLineView = UIView(withAutoLayout: true)
                    activeLineView.backgroundColor = .selection

                    containerView.addSubview(activeLineView)
                    NSLayoutConstraint.activate([
                        activeLineView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                        activeLineView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                        activeLineView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                        activeLineView.heightAnchor.constraint(equalToConstant: 2),
                    ])
                }

                sections.addArrangedSubview(containerView)
            }

            [
                title,
                sections,
            ].forEach(stackView.addArrangedSubview(_:))

            addSubview(stackView)
            stackView.pin(to: self, preserveMargins: true)

            NSLayoutConstraint.activate([
                sections.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            ])
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
