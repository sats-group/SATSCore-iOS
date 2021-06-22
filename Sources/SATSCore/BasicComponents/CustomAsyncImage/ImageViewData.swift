import SwiftUI

/** A generic way to represent Image values.

 When fetching records from a backend, images are usually returned as `URL` types.
 This means we cannot simply pass that `URL` to the view, because the view
 end up with logic and state, which is something we want to avoid.

 Then as a solution for this, we can express that "image" concept as
 `ImageViewData`, this can be rendered with state in a controlled
 manner by `CustomAsyncImage`, **But we also have the ability to directly pass an image to a view**
 making it easier to test/develop in isolation.

 The idea is whenever we have a URL that is a representation of an image,
 we pass `remote(url)` to the view data values.
 */
public enum ImageViewData: Equatable {
    case empty
    case remote(url: URL)
    case loading
    case image(_ image: Image)

    public var url: URL? {
        guard case let .remote(url) = self else { return nil }
        return url
    }

    public var image: Image? {
        guard case let .image(image) = self else { return nil }
        return image
    }

    public var description: String {
        switch self {
        case .empty: return "empty"
        case .image: return "image(_)"
        case let .remote(url): return "remote(url: \(url))"
        case .loading: return "loading"
        }
    }
}

extension ImageViewData: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(description)
        hasher.combine(url)
    }
}
