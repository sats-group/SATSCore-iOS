import SwiftUI

@available(iOS 13.0, *)
public extension Font {
    static func satsH1(variant: SATSFont.FontVariation = .default) -> Font {
        Font(SATSFont.font(style: .h1, variant: variant))
    }

    static func satsH2(variant: SATSFont.FontVariation = .default) -> Font {
        Font(SATSFont.font(style: .h2, variant: variant))
    }

    static func satsH3(variant: SATSFont.FontVariation = .default) -> Font {
        Font(SATSFont.font(style: .h3, variant: variant))
    }

    static func satsLarge(variant: SATSFont.FontVariation = .default) -> Font {
        Font(SATSFont.font(style: .large, variant: variant))
    }

    static func satsBasic(variant: SATSFont.FontVariation = .default) -> Font {
        Font(SATSFont.font(style: .basic, variant: variant))
    }

    static func satsSmall(variant: SATSFont.FontVariation = .default) -> Font {
        Font(SATSFont.font(style: .small, variant: variant))
    }

    static func satsSection(variant: SATSFont.FontVariation = .default) -> Font {
        Font(SATSFont.font(style: .section, variant: variant))
    }

    static func satsButton(variant: SATSFont.FontVariation = .default) -> Font {
        Font(SATSFont.font(style: .button, variant: variant))
    }

    static func satsNavigationTitle(variant: SATSFont.FontVariation = .default) -> Font {
        Font(SATSFont.font(style: .navigationTitle, variant: variant))
    }
}
