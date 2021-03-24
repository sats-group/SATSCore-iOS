import SwiftUI

struct RoundLoadingDemoView: View {
    var roundLoadingViewContainer: UIView {
        let containerView = UIView()
        containerView.backgroundColor = .primary

        let stackView = UIStackView(withAutoLayout: true)
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.addArrangedSubview(loaderView())

        containerView.addSubview(stackView)
        stackView.center(in: containerView)

        return containerView
    }

    func loaderView() -> UIView {
        let loader = RoundLoadingView(withAutoLayout: true)
        loader.fixed(size: 20)
        loader.startAnimating()
        return loader
    }

    var body: some View {
        DemoWrapperView(view: roundLoadingViewContainer)
    }
}

struct RoundLoadingDemoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RoundLoadingDemoView()
            RoundLoadingDemoView()
                .preferredColorScheme(.dark)
        }
    }
}
