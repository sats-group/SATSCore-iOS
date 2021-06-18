import SwiftUI

/** Custom implementation of the `AsyncImage` view from iOS 15
 We took inspiration from that implementation to make a custom one for us.

 This component works together with `ImageViewData` to implement the
 logic to render remote images.

 One big advantage is that we can control the placeholder/loading state and
 also pass a concrete image for testing purposes

 ## Example

 ```
 CustomAsyncImage(.remote(url: url)) { image in
     image
         .resizable()
         .aspectRatio(contentMode: .fit)
         .frame(width: 200, height: 200)
         .background(Color.red)
 }
 ```
 */
public struct CustomAsyncImage<Output: View>: View {
    @ObservedObject var viewModel: ImageViewModel
    let transform: ((Image) -> Output)?

    /// 
    /// - Parameters:
    ///   - state: the initial state for the async image
    ///   - transform: a closure that will be used to add modifiers to the view
    public init(_ state: ImageViewData, transform: ((Image) -> Output)? = nil) {
        self._viewModel = ObservedObject(wrappedValue: ImageViewModel(state: state))
        self.transform = transform
    }

    public var body: some View {
        switch viewModel.state {
        case .empty:
            placeholder
        case .remote:
            placeholder
                .onAppear(perform: viewModel.loadImage)
        case .loading:
            placeholder
                .overlay(progressView)
        case let .image(image):
            if let transform = transform {
                transform(image)
            } else {
                image
            }
        }
    }

    var placeholder: some View {
        Rectangle()
            .foregroundColor(.shimmer)
    }

    var progressView: some View {
        Group {
            if #available(iOS 14, *) {
                ProgressView()
            } else {
                SimpleRepresentable<RoundLoadingView> { view in
                    view.startAnimating()
                }
                .frame(width: 16, height: 16)
            }
        }
    }
}

public extension CustomAsyncImage where Output == Image {
    init(_ state: ImageViewData) {
        self.init(state, transform: nil)
    }
}
