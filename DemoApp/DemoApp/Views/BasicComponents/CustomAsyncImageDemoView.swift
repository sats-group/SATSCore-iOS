import SwiftUI

struct CustomAsyncDemoView: View {
    static let sampleImageUrl = URL(
        string: "https://slothconservation.org/wp-content/uploads/2019/10/IMG_0400-820x1024.jpg"
    )!
    static let sampleImage = Image("treatmentsCover")

    @State var imageViewData: ImageViewData = .image(Self.sampleImage)
    @State var showControls: Bool = true
    @State var uuid = UUID()
    @State var transitionDelay: TimeInterval = 2
    var demoId: String { imageViewData.description + uuid.uuidString }

    var formattedDelay: String {
        String(format: "%.2f", transitionDelay)
    }

    var body: some View {
        VStack {
            CustomAsyncImage(imageViewData, transitionDelay: transitionDelay) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(Color.red)
            }
            .frame(size: 300)
            .background(Color.blue)
            .padding(.top, 100)
            /*
             For demo purposes this is important.

             `CustomAsyncImage` will create an ImageViewModel and that instance
             will live as long CustomAsyncImage is "alive".
             Meaning that even the Initializer of the CustomAsyncImage will be
             called multiple times, the end result will still be the same image,
             even though the values passed are different.

             This is a good thing when using the component, but, when demo-ing,
             we want to dispose irrelevant values of `CustomAsyncImage`, which
             we can achieve by tying the `id` of this view to the `imageViewData`.
             Then `imageViewData` changes we get a fresh copy of `CustomAsyncImage`
             */
            .id(demoId)

            if case .remote = imageViewData {
                Button("Refetch Image", action: refetchRemoteImage)
                    .buttonStyle(.borderedProminent)

                Stepper("Transition Delay: \(formattedDelay)", value: $transitionDelay, in: 0 ... 5)
                    .padding(.horizontal)
            }

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .navigationTitle("Custom Async Image")
        .overlay(controls)
        .background(Color.backgroundPrimary.ignoresSafeArea())
    }

    func refetchRemoteImage() {
        uuid = UUID()
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
