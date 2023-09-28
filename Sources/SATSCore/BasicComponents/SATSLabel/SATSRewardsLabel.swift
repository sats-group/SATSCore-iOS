import SwiftUI

public struct SATSRewardsLabel: View {
    let level: Level

    public init(level: Level) {
        self.level = level
    }

    public var body: some View {
        switch level {
        case .blue:
            SATSLabel("BLUE", style: level.style)
        case .silver:
            SATSLabel("SILVER", style: level.style)
        case .gold:
            SATSLabel("GOLD", style: level.style)
        case .platinum:
            SATSLabel("PLATINUM", style: level.style)
        }
    }
}

#Preview {
    VStack(spacing: .spacingM) {
        SATSRewardsLabel(level: .blue)
        SATSRewardsLabel(level: .silver)
        SATSRewardsLabel(level: .gold)
        SATSRewardsLabel(level: .platinum)
    }
}


public extension SATSRewardsLabel {
    enum Level {
        case blue
        case silver
        case gold
        case platinum

        var style: SATSLabel.Style {
            switch self {
            case .blue:
                return .init(background: .rewardsBlue, foreground: .onPrimary)
            case .silver:
                return .init(background: .rewardsSilver, foreground: .onPrimary)
            case .gold:
                return .init(background: .rewardsGold, foreground: .onPrimary)
            case .platinum:
                return .init(background: .rewardsPlatinum, foreground: .onPrimary)
            }
        }
    }
}
