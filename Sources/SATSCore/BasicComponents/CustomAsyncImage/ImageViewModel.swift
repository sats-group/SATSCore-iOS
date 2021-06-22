import SwiftUI

/// Implementation detail for `CustomAsyncImage`
class ImageViewModel: ObservableObject {
    @Published var state: ImageViewData = .empty

    private var imageClient: ImageClient { Config.imageClient }

    init(state: ImageViewData) {
        self.state = state
    }

    func loadImage() {
        guard case let .remote(imageUrl) = state else { return }

        state = .loading
        imageClient.loadImage(with: imageUrl) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case let .success(image):
                    self?.state = .image(image)
                case .failure:
                    self?.state = .empty
                }
            }
        }
    }
}
