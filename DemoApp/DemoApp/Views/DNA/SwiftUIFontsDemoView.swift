import SwiftUI
import SATSCore

struct SwiftUIFontsDemoView: View {
    @State var fontVariant: FontVariation = .default

    var body: some View {
        VStack {
            FontVariantPicker(fontVariant: $fontVariant)

            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("h1")
                        .font(.satsH1(variant: fontVariant))

                    Text("h2")
                        .font(.satsH2(variant: fontVariant))

                    Text("h3")
                        .font(.satsH3(variant: fontVariant))

                    Text("large")
                        .font(.satsLarge(variant: fontVariant))

                    Text("basic")
                        .font(.satsBasic(variant: fontVariant))

                    Text("small")
                        .font(.satsSmall(variant: fontVariant))

                    Text("section")
                        .font(.satsSection(variant: fontVariant))

                    Text("button")
                        .font(.satsButton(variant: fontVariant))

                    Text("navigationTitle")
                        .font(.satsNavigationTitle(variant: fontVariant))
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
        let text = fontVariant == .satsFeeling ? textStyle.name.uppercased() : textStyle.name

        let label = SATSLabel(style: textStyle, variant: fontVariant)
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
