import SwiftUI

struct TreatmentsViewData {
    let title: String
    let imageUrl: URL?
    let description: NSAttributedString
    let buttonTitle: String
}

class TreatmentsView: UIView {
    // MARK: - Subviews

    private lazy var titleLabel = SATSLabel(style: .h2, variant: .emphasis)

    private lazy var descriptionLabel: SATSLabel = {
        let label = SATSLabel(style: .large)
        label.numberOfLines = 0
        return label
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(withAutoLayout: true)
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
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

        stackView.pinWithinReadableContentGuide(to: scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bookButton.topAnchor, constant: -16),

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
                imageUrl: nil,
                description: NSAttributedString(string: """
                    Sore shoulder after training? Not sure if you are just very upset \
                    or if something is not right? Get a quick assessment by a physiotherapist!
                    """
                ),
                buttonTitle: "Book Appointment"
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
