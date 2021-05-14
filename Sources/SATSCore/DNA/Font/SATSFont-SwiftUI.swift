import SwiftUI

@available(iOS 13.0, *)
public extension View {
    @inlinable func satsFont(_ style: SATSFont.TextStyle, weight: SATSFont.Weight = .default) -> some View {
        self.font(Font(SATSFont.font(style: style, weight: weight)))
    }
}

@available(iOS 13.0, *)
public extension Text {
    func satsFont(_ style: SATSFont.TextStyle, weight: SATSFont.Weight = .default) -> Text {
        self.font(Font(SATSFont.font(style: style, weight: weight)))
    }
}
