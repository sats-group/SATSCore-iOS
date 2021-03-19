import SwiftUI

struct ProgressLineDemoView: View {
    var progressLineContainer: UIView {
        let containerView = UIView()
        containerView.backgroundColor = .backgroundPrimary

        let stackView = UIStackView(withAutoLayout: true)
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.addArrangedSubview(progressView(for: 0.0))
        stackView.addArrangedSubview(progressView(for: 0.6))
        stackView.addArrangedSubview(progressView(for: 1))

        containerView.addSubview(stackView)
        stackView.center(in: containerView)

        return containerView
    }

    func progressView(for percentage: CGFloat) -> UIView {
        let line = ProgressLineView(withAutoLayout: true)
        line.configure(percentage: percentage)
        return line
    }

    var body: some View {
        DemoWrapperView(view: progressLineContainer)
    }
}

struct ProgressLineView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressLineDemoView()
    }
}
