import SwiftUI

public struct SystemChevron: View {
    public init() {}

    public var body: some View {
        Image(systemName: "chevron.right")
            .frame(size: 24)
    }
}
