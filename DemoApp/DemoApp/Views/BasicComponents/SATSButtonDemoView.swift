import SwiftUI

struct SATSButtonDemoView: View {
    @State var size: SATSButton.Size = .basic
    @State var isEnabled: Bool = true
    @State var isLoading: Bool = false

    var settingDescription: String {
        let sizeName: String
        switch size {
        case .basic: sizeName = "Basic"
        case .large: sizeName = "Large"
        default:
            sizeName = "???"
        }

        return "\(isEnabled ? "Enabled" : "Disabled") - \(sizeName)"
    }

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text(settingDescription)
                        .satsFont(.h3)
                    Spacer()
                }
                .padding(.horizontal)

                VStack {
                    demoButton(style: .primary)
                        .padding()

                    demoButton(style: .secondary)
                        .padding()

                    VStack(spacing: 20) {
                        HStack {
                            Spacer()

                            demoButton(style: .clean)

                            Spacer()
                        }

                        HStack {
                            Spacer()

                            demoButton(style: .cleanSecondary)

                            Spacer()
                        }
                    }
                    .padding()
                    .background(Color.satsPrimary)

                    demoButton(style: .cta)
                        .padding()
                }

                Spacer()
            }
            .background(Color.backgroundPrimary.ignoresSafeArea())

            VStack {
                Spacer()

                VStack {
                    Toggle("Enabled", isOn: $isEnabled)

                    Toggle("Loading", isOn: $isLoading)

                    Picker("Size", selection: $size) {
                        Text("basic").tag(SATSButton.Size.basic)
                        Text("large").tag(SATSButton.Size.large)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding()
                .background(Color.backgroundSurfacePrimary)
            }
        }
        .navigationTitle("UIKit Button Styles")
    }

    func demoButton(style: SATSButton.Style) -> some View {
        let button = SATSButton(style: style, size: size, withAutoLayout: false)
        button.setTitle(style.name, for: .normal)
        button.isEnabled = isEnabled
        button.setContentHuggingPriority(.defaultHigh, for: .vertical)
        if isLoading {
            button.startLoader()
        }
        return DemoWrapperView(view: button)
            .id("button-\(style.name)-\(size.hashValue)-\(isLoading)-\(isEnabled)")
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
