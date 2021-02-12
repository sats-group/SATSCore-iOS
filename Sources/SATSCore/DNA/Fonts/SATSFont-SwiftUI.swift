import SwiftUI

@available(iOS 13.0, *)
public extension Font {
    static func satsH1(weight: SATSFont.Weight = .default) -> Font {
        Font(SATSFont.font(style: .h1, weight: weight))
    }

    static func satsH2(weight: SATSFont.Weight = .default) -> Font {
        Font(SATSFont.font(style: .h2, weight: weight))
    }

    static func satsH3(weight: SATSFont.Weight = .default) -> Font {
        Font(SATSFont.font(style: .h3, weight: weight))
    }

    static func satsLarge(weight: SATSFont.Weight = .default) -> Font {
        Font(SATSFont.font(style: .large, weight: weight))
    }

    static func satsBasic(weight: SATSFont.Weight = .default) -> Font {
        Font(SATSFont.font(style: .basic, weight: weight))
    }

    static func satsSmall(weight: SATSFont.Weight = .default) -> Font {
        Font(SATSFont.font(style: .small, weight: weight))
    }

    static func satsSection(weight: SATSFont.Weight = .default) -> Font {
        Font(SATSFont.font(style: .section, weight: weight))
    }

    static func satsButton(weight: SATSFont.Weight = .default) -> Font {
        Font(SATSFont.font(style: .button, weight: weight))
    }

    static func satsNavigationTitle(weight: SATSFont.Weight = .default) -> Font {
        Font(SATSFont.font(style: .navigationTitle, weight: weight))
    }
}
