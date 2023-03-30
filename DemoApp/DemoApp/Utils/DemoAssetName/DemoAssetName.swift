import SwiftUI

enum DemoAssetName: String, CaseIterable {
    case defaultProfile = "default-profile"
    case checkmark
}

extension Image {
    init(_ name: DemoAssetName) {
        self.init(name.rawValue)
    }
}
