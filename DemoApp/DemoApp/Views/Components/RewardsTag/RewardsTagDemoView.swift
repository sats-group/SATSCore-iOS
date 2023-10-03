import SwiftUI

struct RewardsTagDemoView: View {
    var body: some View {
        VStack(spacing: .spacingM) {
            RewardsTag(level: .blue)
            RewardsTag(level: .silver)
            RewardsTag(level: .gold)
            RewardsTag(level: .platinum)
        }
        .padding(.spacingM)
        .navigationTitle("Rewards Tag")
    }
}
