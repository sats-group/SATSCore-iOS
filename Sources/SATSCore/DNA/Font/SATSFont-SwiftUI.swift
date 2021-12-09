import SwiftUI

public extension View {
    @ViewBuilder @inlinable
    func satsFont(_ style: SATSFont.TextStyle, weight: SATSFont.Weight = .default) -> some View {
        self.font(
            .custom(
                SATSFont.fontName(for: weight),
                size: style.size,
                relativeTo: SATSFont.style(for: style.nativeStyle)
            )
        )
    }
}

public extension Text {
    func satsFont(_ style: SATSFont.TextStyle, weight: SATSFont.Weight = .default) -> Text {
        self.font(Font(SATSFont.font(style: style, weight: weight)))
    }
}
