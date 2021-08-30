import SwiftUI

enum DemoAssetName: String, CaseIterable {
    case defaultProfile = "default-profile"
    case moreOptionsButton
}

extension Image {
    init(_ name: DemoAssetName) {
        self.init(name.rawValue)
    }
}
