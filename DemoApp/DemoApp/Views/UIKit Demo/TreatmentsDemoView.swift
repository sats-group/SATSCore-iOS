import SwiftUI

struct TreatmentsViewData {
    let title: String
    let imageUrl: URL?
    let description: NSAttributedString
    let buttonTitle: String
}

class TreatmentsView: UIView {
    // MARK: - Subviews

    private lazy var titleLabel = SATSLabel(style: .h2, weight: .emphasis)

    private lazy var descriptionLabel: SATSLabel = {
        let label = SATSLabel(style: .large)
        label.numberOfLines = 0
        return label
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(withAutoLayout: true)
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var bookButton = SATSButton(style: .primary)

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(withAutoLayout: true)
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.layoutMargins = UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(withAutoLayout: true)
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    // MARK: - Internal methods

    func configure(with viewData: TreatmentsViewData) {
        titleLabel.text = viewData.title

        imageView.image = UIImage(named: "treatmentsCover")
        descriptionLabel.attributedText = viewData.description
        bookButton.setTitle(viewData.buttonTitle, for: .normal)
    }

    // MARK: - Private methods
    private func setup() {
        backgroundColor = .backgroundSecondary

        [
            titleLabel,
            imageView,
            descriptionLabel,
        ].forEach(stackView.addArrangedSubview(_:))

        scrollView.addSubview(stackView)

        [
            scrollView,
            bookButton,
        ].forEach(addSubview(_:))

        scrollView.pin(to: self)
        stackView.pinWithinReadableContentGuide(to: scrollView)

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 500),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.69),

            stackView.widthAnchor.constraint(equalTo: scrollView.readableContentGuide.widthAnchor),

            imageView.widthAnchor.constraint(equalTo: stackView.layoutMarginsGuide.widthAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: stackView.layoutMarginsGuide.widthAnchor),
            stackView.widthAnchor.constraint(equalTo: readableContentGuide.widthAnchor),

            bookButton.leadingAnchor.constraint(equalTo: readableContentGuide.leadingAnchor, constant: 20),
            bookButton.trailingAnchor.constraint(equalTo: readableContentGuide.trailingAnchor, constant: -20),
            bookButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
        ])
    }
}

struct TreatmentsDemoView: View {
    var treatmentView: TreatmentsView {
        let treatmentView = TreatmentsView()
        treatmentView.configure(
            with: TreatmentsViewData(
                title: "SATS treatments",
                imageUrl: URL(
                    string: "https://images.ctfassets.net/bton54gi9dnn/i8qN8WMqkidBBPMvTid46/" +
                        "0779955ce011f4e74f2e1863a5011980/Treatments_v4.png"
                )!,
                description: NSAttributedString(string: """
                            A unique link between treatments and exercise under one roof ensures that you\
                            get a faster way back to an active life. By clicking book below, you will be sent\
                            to a website provided by our partner. We use this partner solution to be able to\
                            offer connection with other health systems if needed.
                            """
                ),
                buttonTitle: "BOOK"
            )
        )
        return treatmentView
    }

    var body: some View {
        DemoWrapperView(view: treatmentView)
            .navigationTitle("UIKit Usage Demo")
    }
}

struct TreatmentsDemoView_Previews: PreviewProvider {
    static var previews: some View {
        TreatmentsDemoView()
    }
}
