import SwiftUI
import SATSCore

extension TextType {
    public var name: String {
        switch self {
        case .h1: return "h1"
        case .h2: return "h2"
        case .h3: return "h3"
        case .h1Medium: return "h1Medium"
        case .h2Medium: return "h2Medium"
        case .h3Medium: return "h3Medium"
        case .h1Emphasis: return "h1Emphasis"
        case .h2Emphasis: return "h2Emphasis"
        case .h3Emphasis: return "h3Emphasis"
        case .h1SatsFeeling: return "h1SatsFeeling"
        case .h2SatsFeeling: return "h2SatsFeeling"
        case .h3SatsFeeling: return "h3SatsFeeling"
        case .large: return "large"
        case .basic: return "basic"
        case .small: return "small"
        case .largeMedium: return "largeMedium"
        case .basicMedium: return "basicMedium"
        case .smallMedium: return "smallMedium"
        case .largeEmphasis: return "largeEmphasis"
        case .basicEmphasis: return "basicEmphasis"
        case .smallEmphasis: return "smallEmphasis"
        case .largeSatsFeeling: return "largeSatsFeeling"
        case .basicSatsFeeling: return "basicSatsFeeling"
        case .smallSatsFeeling: return "smallSatsFeeling"
        case .section: return "section"
        case .button: return "button"
        case .navigationTitle: return "navigationTitle"
        case .extraSmall: return "extraSmall"
        }
    }
}

extension TextType: CaseIterable {
    public typealias AllCases = [TextType]

    public static var allCases: [TextType] = [
        .h1, .h2, .h3,
        .h1Medium, .h2Medium, .h3Medium,
        .h1Emphasis, .h2Emphasis, .h3Emphasis,
        .h1SatsFeeling, .h2SatsFeeling, .h3SatsFeeling,
        .large, .basic, .small,
        .largeMedium, .basicMedium, .smallMedium,
        .largeEmphasis, .basicEmphasis, .smallEmphasis,
        .largeSatsFeeling, .basicSatsFeeling, .smallSatsFeeling,
        .section,
        .button,
        .navigationTitle,
        .extraSmall,
    ]
}

extension TextType: Identifiable {
    public var id: String { name }
}

extension TextType {
    public static var semanticCases: [TextType] = [
        .h1,
        .h2,
        .h3,
        .large,
        .basic,
        .small,
        .section,
        .button,
        .navigationTitle,
        .extraSmall,
    ]
}

struct SATSLabelDemoView: View {
    var body: some View {
        List {
            ForEach(TextType.semanticCases) { type in
                DemoWrapperView(view: SATSLabel(type, color: .primary, text: type.name))
            }
        }
    }
}

struct SATSLabelDemoView_Previews: PreviewProvider {
    static var previews: some View {
        SATSLabelDemoView()
    }
}
