import SwiftUI

struct CustomAsyncDemoView: View {
    static let sampleImageUrl = URL(
        string: "https://slothconservation.org/wp-content/uploads/2019/10/IMG_0400-820x1024.jpg"
    )!
    static let sampleImage = Image("treatmentsCover")

    @State var imageViewData: ImageViewData = .image(Self.sampleImage)
    @State var showControls: Bool = true

    var body: some View {
        VStack {
            Spacer()

            CustomAsyncImage(imageViewData) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .background(Color.red)
            }
            .background(Color.blue)

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .navigationTitle("Custom Async Image")
        .overlay(controls)
        .background(Color.backgroundPrimary.ignoresSafeArea())
    }

    var controls: some View {
        Group {
            if showControls {
                VStack {
                    Spacer()

                    Picker("State", selection: $imageViewData) {
                        Text("Empty").tag(ImageViewData.empty)
                        Text("Remote URL").tag(ImageViewData.remote(url: Self.sampleImageUrl))
                        Text("Loading").tag(ImageViewData.loading)
                        Text("Image").tag(ImageViewData.image(Self.sampleImage))
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding(.horizontal)
            } else {
                EmptyView()
            }
        }
    }
}

struct CustomAsyncDemoView_Previews: PreviewProvider {
    static func demoView(_ state: ImageViewData, showControls: Bool = false) -> some View {
        CustomAsyncDemoView(imageViewData: state, showControls: showControls)
    }

    static var previews: some View {
        Group {
            NavigationView {
                demoView(.remote(url: CustomAsyncDemoView.sampleImageUrl), showControls: true)
            }
            .previewDisplayName("Demo version")

            Group {
                demoView(.remote(url: CustomAsyncDemoView.sampleImageUrl))
                    .previewDisplayName("Live URL view")

                demoView(.empty)
                    .previewDisplayName("Empty State")

                demoView(.loading)
                    .previewDisplayName("Loading State")

                demoView(.image(CustomAsyncDemoView.sampleImage))
                    .previewDisplayName("Fixed Image")
            }
            .previewLayout(.fixed(width: 300, height: 300))
        }
    }
}
