import SwiftUI

struct ErrorDemoView: View {
    var errorContainer: UIView {
        let containerView = UIView()
        containerView.backgroundColor = .backgroundPrimary

        let errorView = ErrorView(withAutoLayout: true)
        errorView.configure(
            with: .init(
                title: "Ooops!",
                message: "Something went terribly wrong",
                canRetry: true
            )
        )

        containerView.addSubview(errorView)
        errorView.pinToSuperview()

        return containerView
    }

    var body: some View {
        DemoWrapperView(view: errorContainer)
            .navigationTitle("ErrorView")
    }
}

struct ErrorDemoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ErrorDemoView()

            ErrorDemoView()
                .colorScheme(.dark)
        }
    }
}
