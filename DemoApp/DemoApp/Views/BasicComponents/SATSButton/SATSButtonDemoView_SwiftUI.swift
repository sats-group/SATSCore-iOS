import SwiftUI
import SATSCore

// swiftlint:disable:next type_name
struct SATSButtonDemoView_SwiftUI: View {
    var body: some View {
        SATSButtonDemoContainer(buttonBuilder: demoButton(style:setting:))
            .navigationTitle("SwiftUI Button Style")
    }

    func demoButton(style: SATSButton.Style, setting: SATSButtonDemoSetting) -> some View {
        Button(action: {}, label: { demoLabel(style.name, setting: setting) })
            .satsButton(
                style,
                size: setting.size,
                isLoading: setting.isLoading
            )
    }

    func demoLabel(_ text: String, setting: SATSButtonDemoSetting) -> some View {
        HStack(spacing: .spacingXXS) {
            if setting.includeIcon {
                Image(systemName: "plus.circle")
            }

            Text(text)
        }
    }
}

#Preview {
    NavigationView {
        SATSButtonDemoView_SwiftUI()
    }
}
