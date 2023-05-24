import SwiftUI

struct ProfilePictureDemoView: View {
    var body: some View {
        VStack {
            ProfilePictureView(imageData: .loading, size: .spacingL)

            ProfilePictureView(imageData: .loading, size: .spacingXXL)

            ProfilePictureView(imageData: .loading, size: 200)

            ProfilePictureView(imageData: .image(Image("default-profile")), size: 200)
        }
        .navigationTitle("ProfilePictureView")
    }
}

struct ProfilePictureDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfilePictureDemoView()
        }
    }
}
