import SwiftUI

struct SATSButtonDemoSetting {
    var size: SATSButton.Size = .basic
    var isEnabled: Bool = true
    var isLoading: Bool = false
    var includeIcon: Bool = false

    var description: String {
        let sizeName: String
        switch size {
        case .basic: sizeName = "Basic"
        case .large: sizeName = "Large"
        default:
            sizeName = "???"
        }

        return "\(isEnabled ? "Enabled" : "Disabled") - \(sizeName)"
    }
}

struct SATSButtonDemoContainer<Content: View>: View {
    @State var setting: SATSButtonDemoSetting = .init()

    let buttonBuilder: (SATSButton.Style, SATSButtonDemoSetting) -> Content
    let buttonSpacing: CGFloat = .spacingL

    func demoButton(_ style: SATSButton.Style) -> some View {
        buttonBuilder(style, setting)
    }

    var body: some View {
        ZStack {
            ScrollView {
                HStack {
                    Text(setting.description)
                        .satsFont(.h3)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, .spacingL)

                VStack(spacing: buttonSpacing) {
                    demoButton(.primary)
                    demoButton(.secondary)
                    demoButton(.tertiary)

                    VStack(spacing: .spacingL) {
                        demoButton(.clean)
                        demoButton(.cleanSecondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.satsPrimary)

                    demoButton(.cta)
                }
                .disabled(!setting.isEnabled)

                Spacer()
                    .frame(height: 300)
            }
            .background(Color.backgroundPrimary.ignoresSafeArea())

            VStack {
                Spacer()

                VStack {
                    Toggle("Enabled", isOn: $setting.isEnabled)

                    Toggle("Loading", isOn: $setting.isLoading)

                    Toggle("Include Icon", isOn: $setting.includeIcon)

                    Picker("Size", selection: $setting.size) {
                        Text("basic").tag(SATSButton.Size.basic)
                        Text("large").tag(SATSButton.Size.large)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding()
                .background(Color.backgroundSurfacePrimary)
                .cornerRadius(.cornerRadiusM)
                .overlay(
                    RoundedRectangle(cornerRadius: .cornerRadiusM)
                        .stroke(Color.border, lineWidth: 1)
                )
                .padding()
            }
        }
    }
}
