import SwiftUI

/// Implementation detail for `CustomAsyncImage`
class ImageViewModel: ObservableObject {
    @Published var state: ImageViewData = .empty

    private var imageClient: ImageClient { Config.imageClient }

    init(state: ImageViewData) {
        self.state = state
    }

    /// Loads and assign the remote image if needed,
    /// basically, if the state is declared as `.remote(URL)`
    @MainActor func loadImageIfNeeded() async {
        guard case let .remote(imageUrl) = state else { return }

        withAnimation { state = .loading }

        do {
            let image = try await imageClient.loadImage(with: imageUrl)
            withAnimation { state = .image(image) }
        } catch {
            withAnimation { state = .empty }
        }
    }
}
