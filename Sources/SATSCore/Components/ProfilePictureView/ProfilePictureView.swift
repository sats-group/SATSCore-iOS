import SwiftUI

public struct ProfilePictureView: View {
    let imageData: ImageViewData
    let size: CGFloat

    public init(imageData: ImageViewData, size: CGFloat) {
        self.imageData = imageData
        self.size = size
    }

    public var body: some View {
        CustomAsyncImage(imageData) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .controlSize(spinnerSize)
        .clipShape(Circle())
        .frame(size: size)
    }

    var spinnerSize: ControlSize {
        if size <= .spacingL {
            .mini
        } else if size <= .spacingXXXL {
            .regular
        } else {
            .large
        }
    }
}

struct ProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ProfilePictureView(imageData: .loading, size: .spacingL)

            ProfilePictureView(imageData: .loading, size: .spacingXXL)

            ProfilePictureView(imageData: .loading, size: 200)
        }
    }
}
