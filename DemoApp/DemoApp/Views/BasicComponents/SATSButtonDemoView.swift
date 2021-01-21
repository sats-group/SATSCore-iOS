import SwiftUI
import SATSCore

struct SATSButtonDemoView: View {
    func sampleButton(
        _ title: String,
        layoutStyle: SATSButton.LayoutStyle = .regular,
        displayStyle: SATSButton.DisplayStyle = .positiveMain
    ) -> DemoWrapperView<SATSButton> {
        let button = SATSButton()
        button.setTitle(title, for: .normal)
        button.layoutStyle = layoutStyle
        button.displayStyle = displayStyle

        return DemoWrapperView(view: button)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Group {
                sampleButton("Positive Main", layoutStyle: .compact, displayStyle: .positiveMain)
                sampleButton("Positive Secondary", layoutStyle: .compact, displayStyle: .positiveSecondary)
            }
            .padding(.horizontal)

            VStack(alignment: .leading, spacing: 16) {
                sampleButton("Negative Main", layoutStyle: .compact, displayStyle: .negativeMain)
                sampleButton("Negative Secondary", layoutStyle: .compact, displayStyle: .negativeSecondary)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(ColorTheme.UINegative.background.color))

            Group {
                sampleButton("Error", layoutStyle: .compact, displayStyle: .error)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding(.top)
        .navigationTitle("SATS Button")
        .frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading)
        .background(
            Color(UIColor.secondarySystemBackground)
                .ignoresSafeArea()
        )
    }
}

struct SATSButtonDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SATSButtonDemoView()
        }
    }
}
