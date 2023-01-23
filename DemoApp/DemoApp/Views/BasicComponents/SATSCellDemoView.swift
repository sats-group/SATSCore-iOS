import SwiftUI

struct SATSCellDemoView: View {
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                cell(iconName: nil, title: "Rewards")
                cell(iconName: "trophy", title: "Rewards")
                cell(iconName: "trophy", title: "Rewards", subtitle: "Sample subtitlte")
                    .foregroundColor(.red)
                cell(action: { Image(systemName: "questionmark.circle") })

                cell(
                    iconName: "person.text.rectangle",
                    title: "My page",
                    subtitle: "Upgrade, downgrade, cancel",
                    action: { Image(systemName: "square.and.arrow.up") }
                )
                .foregroundColor(.action)

                cell(accessory: { Text("Gold") })

                cell(
                    iconName: "xmark.circle",
                    title: "Log out",
                    action: { EmptyView() },
                    includeDivider: false
                )
                .foregroundColor(.signalError)
            }
            .cornerRadius(.cornerRadiusS)
            .shadow(color: Color.black.opacity(0.2), radius: 6)

            Spacer()
        }
        .padding()
        .background(Color.backgroundPrimary)
        .navigationTitle("SATSCell")
    }

    func cell<AccessoryView: View, ActionView: View>(
        iconName: String? = "trophy",
        title: String = "Rewards",
        subtitle: String? = nil,
        @ViewBuilder accessory: () -> AccessoryView = EmptyView.init,
        @ViewBuilder action: () -> ActionView = SATSCell.SystemChevron.init,
        includeDivider: Bool = true
    ) -> some View {
        SATSCell.BasicCell(
            icon: {
                if let iconName {
                    SATSCell.SystemIcon(iconName: iconName)
                } else {
                    SATSCell.NoIcon()
                }
            },
            title: title,
            subtitle: subtitle,
            accessory: accessory,
            action: action,
            includeDivider: includeDivider,
            onClick: nil
        )
    }
}

struct SATSCellDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SATSCellDemoView()
        }
    }
}
