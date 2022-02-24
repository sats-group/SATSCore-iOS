import SwiftUI

public extension View {
    @ViewBuilder
    func satsFont(_ style: SATSFont.TextStyle, weight: SATSFont.Weight = .default) -> some View {
        self.font(.satsFont(style, weight: weight))
    }
}

public extension Text {
    func satsFont(_ style: SATSFont.TextStyle, weight: SATSFont.Weight = .default) -> Text {
        self.font(.satsFont(style, weight: weight))
    }
}

public extension Font {
    static func satsFont(_ style: SATSFont.TextStyle, weight: SATSFont.Weight = .default) -> Font {
        Font(SATSFont.font(style: style, weight: weight))
    }
}
