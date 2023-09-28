import SwiftUI
import SATSCore

typealias FontVariation = SATSFont.Weight

struct SATSLabelLeagcyDemoView: View {
    @State var weight: FontVariation = .default

    var body: some View {
        VStack {
            FontWeightPicker(weight: $weight)

            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(SATSFont.TextStyle.allCases, content: wrappedSATSLabel(for:))
                }
                .id(weight.name)
            }
            .padding()
        }
        .navigationTitle("UIKit Labels")
        .background(
            Color(UIColor.systemBackground)
                .ignoresSafeArea()
        )
    }

    func wrappedSATSLabel(for textStyle: SATSFont.TextStyle) -> some View {
        let text = weight == .satsFeeling ? textStyle.name.uppercased() : textStyle.name

        let label = SATSLabelLegacy(style: textStyle, weight: weight)
        label.text = text

        return DemoWrapperView(view: label)
    }
}

// MARK: - Preview

struct SATSLabelDemoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                SATSLabelLeagcyDemoView(weight: .medium)
            }

            NavigationView {
                SATSLabelLeagcyDemoView()
            }
            .environment(\.sizeCategory, .accessibilityExtraExtraLarge)

            NavigationView {
                SATSLabelLeagcyDemoView()
            }
            .environment(\.colorScheme, .dark)
        }
    }
}

// MARK: - Extensions for demo

extension SATSFont.TextStyle: Identifiable {
    public var id: String { name }

    static let allCases: [SATSFont.TextStyle] = [
        .h1,
        .h2,
        .h3,
        .large,
        .basic,
        .small,
        .section,
        .button,
        .navigationTitle,
    ]
}

extension SATSFont.Weight: Identifiable {
    public var id: String { name }

    static let allCases: [SATSFont.Weight] = [
        .default,
        .medium,
        .emphasis,
        .satsFeeling,
    ]
}
