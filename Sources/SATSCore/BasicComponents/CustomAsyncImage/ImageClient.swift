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
