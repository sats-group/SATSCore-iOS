import SwiftUI

/// Requirements for an `ImageClient` to be used in `CustomAsyncImage`.
///
/// The main idea is that this UI library is mostly state-less, also the actual
/// logic of fetching images, which can include caching and more advanced
/// mechanisms is out of the scope of this library.
public protocol ImageClient {
    /// Performs a network request to load the image given the URL
    /// - Parameter url: the URL of the image to load
    /// - Returns: the SwiftUI Image for the given URL
    func loadImage(with url: URL) async throws -> Image
}

/// Internal only type as a simple/default implementation of the `ImageClient` protocol.
class DefaultImageClient: ImageClient {
    func loadImage(with url: URL) async throws -> Image {
        let (imageData, _) = try await URLSession.shared.data(from: url)
        guard let uiImage = UIImage(data: imageData) else { throw ImageError.decodeError }
        return Image(uiImage: uiImage)
    }

    enum ImageError: LocalizedError {
        case decodeError

        var errorDescription: String? {
            switch self {
            case .decodeError: return "We got the image data but couldn't convert it to a proper image"
            }
        }
    }
}
