import SwiftUI

struct BannerImageDemoView: View {
    var body: some View {
        VStack {
            Spacer()
            BannerImage(
                imageViewData: .image(Image("articlePageCover")),
                title: "Winter Training"
            )
            Spacer()
        }
        .navigationTitle("Banner Image")
    }
}

struct BannerImageDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BannerImageDemoView()
        }
    }
}
