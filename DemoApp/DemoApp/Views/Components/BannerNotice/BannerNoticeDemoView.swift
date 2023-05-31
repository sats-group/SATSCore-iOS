import SwiftUI
import SATSCore

struct BannerNoticeDemoView: View {
    var body: some View {
        VStack(spacing: .spacingM) {
            BannerNotice(
                viewData: .init(
                    message: "Banner with action and icon",
                    action: .init(title: "Action", icon: Image(systemName: "link"), onClick: { })
                )
            )

            BannerNotice(
                viewData: .init(
                    message: "Banner with action without icon",
                    action: .init(title: "Action", onClick: { })
                )
            )

            BannerNotice(viewData: .init(message: "Banner"))
        }
        .navigationTitle("BannerNotice")
    }
}

struct BannerNoticeDemoView_Previews: PreviewProvider {
    static var previews: some View {
        BannerNoticeDemoView()
    }
}
