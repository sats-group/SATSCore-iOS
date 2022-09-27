import SwiftUI

private extension SATSFont.TextStyle {
    /// 46 pts - Custom text style, only applicable for content banners
    static let headline = SATSFont.TextStyle(size: 46, nativeStyle: .largeTitle, name: "headline")
}

public struct BannerImage: View {
    let imageViewData: ImageViewData?
    let title: String

    public init(imageViewData: ImageViewData?, title: String) {
        self.imageViewData = imageViewData
        self.title = title
    }

    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    public var body: some View {
        GeometryReader { proxy in
            Group {
                if let imageViewData = imageViewData {
                    CustomAsyncImage(imageViewData) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                } else {
                    Color.shimmer
                }
            }
            .frame(width: proxy.size.width)
            .clipped()
        }
        .frame(height: horizontalSizeClass == .regular ? 360 : 240)
        .frame(maxWidth: .readableWidthL)
        .overlay(Color.black.opacity(0.6))
        .clipShape(RoundedRectangle(cornerRadius: horizontalSizeClass == .regular ? .cornerRadiusM : 0))
        .clipped()
        .overlay(className)
    }

    var className: some View {
        Text(title)
            .satsFont(.headline, weight: .satsFeeling)
            .textCase(.uppercase)
            .padding(.spacingXXS)
            .drawingGroup()
            .foregroundColor(.onPrimary)
            .multilineTextAlignment(.center)
            .padding(.spacingM)
            .frame(maxWidth: .readableWidthM, alignment: .center)
    }
}
