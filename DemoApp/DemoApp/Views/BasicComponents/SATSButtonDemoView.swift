import SwiftUI

struct SATSButtonDemoView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                VStack {
                    Text("Large")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    demoButton(style: .primary, size: .large)

                    demoButton(style: .secondary, size: .large)

                    demoButton(style: .cta, size: .large)

                }

                VStack {
                    Text("Regular")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    demoButton(style: .primary, size: .regular)

                    demoButton(style: .secondary, size: .regular)

                    demoButton(style: .cta, size: .regular)

                }

                VStack {
                    Text("Compact")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    demoButton(style: .primary, size: .compact)

                    demoButton(style: .secondary, size: .compact)

                    demoButton(style: .cta, size: .compact)
                }

                Spacer()
                    .layoutPriority(1)
            }
            .padding()
            .navigationTitle("SATSButton")
        }
    }

    func demoButton(style: SATSButton.Style, size: SATSButton.Size) -> some View {
        let button = SATSButton(style: style, size: size, withAutoLayout: false)
        button.setTitle(style.name, for: .normal)
        return DemoWrapperView(view: button)
    }
}

struct SATSButtonDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ColorTheme.current = .blue

        return NavigationView {
            SATSButtonDemoView()
        }
    }
}
