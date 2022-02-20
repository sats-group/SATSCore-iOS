import SwiftUI

public extension View {
    var backport: Backport<Self> { Backport(self) }
}

