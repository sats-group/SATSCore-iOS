import SwiftUI
import SATSCore

struct SwiftUIFontsDemoView: View {
    @State var weight: FontVariation = .default

    var body: some View {
        VStack {
            FontWeightPicker(weight: $weight)

            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("h1")
                        .font(.satsH1(weight: weight))

                    Text("h2")
                        .font(.satsH2(weight: weight))

                    Text("h3")
                        .font(.satsH3(weight: weight))

                    Text("large")
                        .font(.satsLarge(weight: weight))

                    Text("basic")
                        .font(.satsBasic(weight: weight))

                    Text("small")
                        .font(.satsSmall(weight: weight))

                    Text("section")
                        .font(.satsSection(weight: weight))

                    Text("button")
                        .font(.satsButton(weight: weight))

                    Text("navigationTitle")
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
