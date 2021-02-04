import SwiftUI
import SATSCore

typealias FontVariation = SATSFont.FontVariation

struct SATSLabelDemoView: View {
    @State var fontVariant: FontVariation = .default

    var body: some View {
        VStack {
            Picker("Variant", selection: $fontVariant) {
                Text(FontVariation.default.name).tag(FontVariation.default)
                Text(FontVariation.medium.name).tag(FontVariation.medium)
                Text(FontVariation.emphasis.name).tag(FontVariation.emphasis)
                Text(FontVariation.satsFeeling.name).tag(FontVariation.satsFeeling)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(SATSFont.TextStyle.allCases, content: wrappedSATSLabel(for:))
                }
                .id(fontVariant.name)
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
        let text = fontVariant == .satsFeeling ? textStyle.name.uppercased() : textStyle.name

        let label = SATSLabel(style: textStyle, variant: fontVariant)
        label.text = text

        return DemoWrapperView(view: label)
    }
}

// MARK: - Preview

struct SATSLabelDemoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                SATSLabelDemoView(fontVariant: .medium)
            }

            NavigationView {
                SATSLabelDemoView()
            }
            .environment(\.sizeCategory, .accessibilityExtraExtraLarge)

            NavigationView {
                SATSLabelDemoView()
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

extension SATSFont.FontVariation: Identifiable {
    public var id: String { name }

    static let allCases: [SATSFont.FontVariation] = [
        .default,
        .medium,
        .emphasis,
        .satsFeeling,
    ]
}
