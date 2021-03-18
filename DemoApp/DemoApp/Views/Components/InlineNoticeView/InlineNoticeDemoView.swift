import SwiftUI

struct InlineNoticeDemoView: View {
    var noticeContainer: UIView {
        let containerView = UIView()
        containerView.backgroundColor = .backgroundPrimary

        let inlineNotice = InlineNoticeView(withAutoLayout: true)
        inlineNotice.configure(
            icon: UIImage(named: "inline-notice-phone"),
            title: "Themes in the app",
            subtitle: "Go to settings to enable it."
        )

        containerView.addSubview(inlineNotice)

        NSLayoutConstraint.activate([
            inlineNotice.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            inlineNotice.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            inlineNotice.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ])

        return containerView
    }

    func progressView(for percentage: CGFloat) -> UIView {
        let line = ProgressLineView(withAutoLayout: true)
        line.configure(percentage: percentage)
        return line
    }

    var body: some View {
        DemoWrapperView(view: noticeContainer)
    }
}

struct InlineNoticeDemoView_Previews: PreviewProvider {
    static var previews: some View {
        InlineNoticeDemoView()
    }
}
