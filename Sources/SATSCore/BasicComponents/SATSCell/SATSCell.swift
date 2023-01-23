import SwiftUI

public enum SATSCell {}

// MARK: Cell - Icon Views

public extension SATSCell {
    /// SF Symbol base icon
    struct SystemIcon: View {
        var iconName: String

        public init(iconName: String) {
            self.iconName = iconName
        }

        public var body: some View {
            Image(systemName: iconName)
                .frame(minWidth: 28)
        }
    }

    /// Placeholder for no icon
    struct NoIcon: View {
        public init() {}

        public var body: some View {
            Color.clear.frame(size: 0)
        }
    }
}

// MARK: Cell - Action Views

public extension SATSCell {
    /// SF Symbol for chevrons
    struct SystemChevron: View {
        public init() {}

        public var body: some View {
            Image(systemName: "chevron.right")
        }
    }
}
