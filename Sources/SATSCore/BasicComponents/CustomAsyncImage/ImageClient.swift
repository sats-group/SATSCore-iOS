import SwiftUI

/// Requirements for an `ImageClient` to be used in `CustomAsyncImage`.
///
/// The main idea is that this UI library is mostly state-less, also the actual
/// logic of fetching images, which can include caching and more advanced
/// mechanisms is out of the scope of this library.
public protocol ImageClient {
    /// Performs a network request to load the image given the URL
    /// - Parameters:
    ///   - url: the URL of the image to load
    ///   - onCompletion: Closure that will return a result with a `SwiftUI.Image`
    ///                   value if the operation was a success, an error otherwise
    func loadImage(with url: URL, onCompletion: @escaping (Result<Image, Error>) -> Void)
}

/// Internal only type as a simple/default implementation of the `ImageClient` protocol.
class DefaultImageClient: ImageClient {
    var task: URLSessionDataTask?

    func loadImage(with url: URL, onCompletion: @escaping (Result<Image, Error>) -> Void) {
        task = URLSession.shared.dataTask(with: url) { imageData, _, error in
            if let imageData = imageData {
                if let uiImage = UIImage(data: imageData) {
                    let image = Image(uiImage: uiImage)
                    onCompletion(.success(image))
                } else {
                    onCompletion(.failure(ImageError.decodeError))
                }
            } else if let error = error {
                onCompletion(.failure(error))
            } else {
                onCompletion(.failure(ImageError.noData))
            }
        }

        task?.resume()
    }

    enum ImageError: LocalizedError {
        case decodeError
        case noData

        var errorDescription: String? {
            switch self {
            case .decodeError: return "We got the image data but couldn't convert it to a proper image"
            case .noData: return "We didn't receive any data, but no error"
            }
        }
    }
}
