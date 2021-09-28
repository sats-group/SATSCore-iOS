import SwiftUI

enum DemoAssetName: String, CaseIterable {
    case defaultProfile = "default-profile"
    case moreOptionsButton

    // Tab Bar
    case tabHomeOn = "home-on"
    case tabHomeOff = "home-off"

    case tabBookingOn = "book-on"
    case tabBookingOff = "book-off"

    case tabTrainingOn = "training-on"
    case tabTrainingOff = "training-off"

    case tabProfileOn = "profile-on"
    case tabProfileOff = "profile-off"

    case checkmark
}

extension Image {
    init(_ name: DemoAssetName) {
        self.init(name.rawValue)
    }
}
