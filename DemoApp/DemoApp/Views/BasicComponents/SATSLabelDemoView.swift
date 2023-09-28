import SwiftUI

struct SATSLabelDemoView: View {
    @State var page: Page = .label

    var body: some View {
        VStack {
            Spacer()

            switch page {
            case .label: label
            case .rewards: rewards
            }

            Spacer()

            Picker("Page", selection: $page) {
                Text("Label").tag(Page.label)
                Text("Rewards").tag(Page.rewards)
            }
            .pickerStyle(.segmented)
        }
        .padding(.spacingM)
    }

    var label: some View {
        VStack(spacing: .spacingM) {
            SATSLabel("Primary", style: .primary)
            SATSLabel("Secondary", style: .secondary)
            SATSLabel("Coral", style: .coral)
        }
    }

    var rewards: some View {
        VStack(spacing: .spacingM) {
            SATSRewardsLabel(level: .blue)
            SATSRewardsLabel(level: .silver)
            SATSRewardsLabel(level: .gold)
            SATSRewardsLabel(level: .platinum)
        }
    }
}

extension SATSLabelDemoView {
    enum Page {
        case label
        case rewards
    }
}

#Preview {
    SATSLabelDemoView()
}
