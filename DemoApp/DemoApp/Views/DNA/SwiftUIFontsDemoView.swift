import SwiftUI
import SATSCore

struct SwiftUIFontsDemoView: View {
    @State var weight: FontVariation = .default

    var body: some View {
        VStack {
            FontWeightPicker(weight: $weight)

            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 16) {
                    weightedText("h1")
                        .font(.satsH1(weight: weight))

                    weightedText("h2")
                        .font(.satsH2(weight: weight))

                    weightedText("h3")
                        .font(.satsH3(weight: weight))

                    weightedText("large")
                        .font(.satsLarge(weight: weight))

                    weightedText("basic")
                        .font(.satsBasic(weight: weight))

                    weightedText("small")
                        .font(.satsSmall(weight: weight))

                    weightedText("section")
                        .font(.satsSection(weight: weight))

                    weightedText("button")
                        .font(.satsButton(weight: weight))

                    weightedText("navigationTitle")
                        .font(.satsNavigationTitle(weight: weight))
                }
                .frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading)
            }
            .padding()
        }
        .navigationTitle("Fonts - SwiftUI")
        .background(
            Color(UIColor.systemBackground)
                .ignoresSafeArea()
        )
    }

    func weightedText(_ text: String) -> Text {
        let text = weight == .satsFeeling ? text.uppercased() : text
        return Text(text)
    }

    func wrappedSATSLabel(for textStyle: SATSFont.TextStyle) -> some View {
        let text = weight == .satsFeeling ? textStyle.name.uppercased() : textStyle.name

        let label = SATSLabel(style: textStyle, weight: weight)
        label.text = text

        return DemoWrapperView(view: label)
    }
}

struct SwiftUIFontsDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SwiftUIFontsDemoView()
        }
    }
}
