import SwiftUI

struct SATSGradient: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    let fallbackColor: Color

    func body(content: Content) -> some View {
        content.background(backgroundGradient)
    }

    var backgroundGradient: some View {
        Group {
            if colorScheme == .light {
                LinearGradient(
                    stops: [
                        .init(color: .graphicalElements1.opacity(0), location: 0),
                        .init(color: .graphicalElements1.opacity(1), location: 0.22),
                        .init(color: .graphicalElements1.opacity(0), location: 0.65),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .opacity(0.2)
                .background(Color.backgroundSecondary)
            } else {
                fallbackColor
            }
        }
        .ignoresSafeArea()
    }
}

public extension View {
    func satsGradientBackground(fallbackColor: Color = .backgroundPrimary) -> some View {
        modifier(SATSGradient(fallbackColor: fallbackColor))
    }
}
