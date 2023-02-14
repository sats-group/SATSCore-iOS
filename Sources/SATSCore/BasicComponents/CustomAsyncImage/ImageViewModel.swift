import SwiftUI

/// Implementation detail for `CustomAsyncImage`
class ImageViewModel: ObservableObject {
    @Published var state: ImageViewData = .empty

    let transitionDelay: TimeInterval

    private var imageClient: ImageClient { Config.imageClient }

    init(state: ImageViewData, transitionDelay: TimeInterval = 0) {
        self.state = state
        self.transitionDelay = transitionDelay
    }

    /// Loads and assign the remote image if needed,
    /// basically, if the state is declared as `.remote(URL)`
    @MainActor func loadImageIfNeeded() async {
        guard case let .remote(imageUrl) = state else { return }

        withAnimation { state = .loading }

        do {
            let image = try await imageClient.loadImage(with: imageUrl)
            await delay(for: transitionDelay)
            withAnimation { state = .image(image) }
        } catch {
            await delay(for: transitionDelay)
            withAnimation { state = .empty }
        }
    }

    func delay(for timeInterval: TimeInterval) async {
        if #available(iOS 16.0, *) {
            try? await Task.sleep(for: .seconds(timeInterval))
        }
    }
}
