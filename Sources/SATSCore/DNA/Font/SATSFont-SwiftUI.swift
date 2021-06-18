import SwiftUI

public extension View {
    @inlinable func satsFont(_ style: SATSFont.TextStyle, weight: SATSFont.Weight = .default) -> some View {
        self.font(Font(SATSFont.font(style: style, weight: weight)))
    }
}

public extension Text {
    func satsFont(_ style: SATSFont.TextStyle, weight: SATSFont.Weight = .default) -> Text {
        self.font(Font(SATSFont.font(style: style, weight: weight)))
    }
}
