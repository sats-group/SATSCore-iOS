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
    @MainActor func loadImageIfNeeded(size: CGSize, viewRedaction: RedactionReasons) async {
        guard
            case let .remote(imageUrl) = state,
            viewRedaction != .placeholder,
            size != .zero
        else { return }

        state = .loading

        do {
            let url = addSizeQueryItemsIfNeeded(with: imageUrl, for: size)
            let image = try await imageClient.loadImage(with: url)
            state = .image(image)
        } catch {
            state = .empty
        }
    }

    private func addSizeQueryItemsIfNeeded(with url: URL, for size: CGSize) -> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        guard components?.host == "images.ctfassets.net" else { return url }

        components?.queryItems = [
            URLQueryItem(name: "w", value: "\(size.width)"),
            URLQueryItem(name: "h", value: "\(size.height)"),
        ]

        guard let newUrl = components?.url else { return url }
        return newUrl
    }
}
