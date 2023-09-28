import SwiftUI

public struct RewardsTag: View {
    let level: Level

    public init(level: Level) {
        self.level = level
    }

    public var body: some View {
        Text(level.rawValue)
            .foregroundStyle(Color.onRewards)
            .textCase(.uppercase)
            .satsFont(.small)
            .padding(.vertical, .spacingXXS)
            .padding(.horizontal, .spacingS)
            .background(level.background)
            .cornerRadius(4)
    }
}

struct RewardsTag_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: .spacingM) {
            RewardsTag(level: .blue)
            RewardsTag(level: .silver)
            RewardsTag(level: .gold)
            RewardsTag(level: .platinum)
        }
    }
}

public extension RewardsTag {
    enum Level: String {
        case blue = "Blue"
        case silver = "Silver"
        case gold = "Gold"
        case platinum = "Platinum"

        var background: Color {
            switch self {
            case .blue: .rewardsBlue
            case .silver: .rewardsSilver
            case .gold: .rewardsGold
            case .platinum: .rewardsPlatinum
            }
        }
    }
}
