import SwiftUI

// swiftlint:disable:next type_name
struct SATSButtonDemoView_UIKit: View {
    var body: some View {
        SATSButtonDemoContainer(buttonBuilder: demoButton(style:setting:))
            .navigationTitle("UIKit Button Styles")
    }

    func demoButton(style: SATSButton.Style, setting: SATSButtonDemoSetting) -> some View {
        let button = SATSButton(style: style, size: setting.size, withAutoLayout: false)
        button.setTitle(style.name, for: .normal)
        if setting.includeIcon {
            button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        }
        button.isEnabled = setting.isEnabled
        if setting.isLoading {
            button.startLoader()
        }

        return DemoWrapperView(view: button)
            .id(buttonId(button, setting: setting))
    }

    func buttonId(_ button: SATSButton, setting: SATSButtonDemoSetting) -> String {
        [
            "button",
            button.style.name,
            "\(setting.size.hashValue)",
            "\(setting.isLoading)",
            "\(setting.isEnabled)",
            "\(setting.includeIcon)",
            String(describing: button.configuration?.buttonSize),
        ].joined(separator: "-")
    }
}

#Preview {
    NavigationView {
        SATSButtonDemoView_UIKit()
    }
}
