import SwiftUI

/// Score indicator
/// used to show for example "Strength" level in Gx classes
public struct ScoreView: View {
    let title: String
    let score: Int

    private let offColor = Color.onBackgroundDisabledOff
    private let onColor = Color.onBackgroundEnabledOn
    private let maxScore: Int

    public init(title: String, score: Int, maxScore: Int = 4) {
        self.title = title
        self.score = score
        self.maxScore = maxScore

        guard score >= 0 && score <= maxScore else {
            preconditionFailure("❌ score should between 0 and \(maxScore)")
        }
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .satsFont(.basic)
                .foregroundColor(.onSecondary)

            Rectangle()
                .frame(height: 8)
                .foregroundColor(Color.clear)
                .overlay(
                    HStack(spacing: 2) {
                        ForEach(Array(0..<maxScore), id: \.self) { index in
                            Rectangle()
                                .foregroundColor(score >= (index + 1) ? onColor : offColor)
                        }
                    }
                )
                .cornerRadius(4)
                .clipped()
        }
    }
}
