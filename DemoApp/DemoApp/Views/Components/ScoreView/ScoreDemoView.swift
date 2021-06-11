import SwiftUI

struct ScoreDemoView: View {
    var body: some View {
        VStack(spacing: 24) {
            ScoreView(title: "Strength", score: 3)

            ScoreView(title: "Balance", score: 0)

            ScoreView(title: "Coordination", score: 4)

            ScoreView(title: "Something", score: 1)

            ScoreView(title: "Passion", score: 9, maxScore: 10)
        }
        .padding()
        .background(Color.backgroundPrimary.ignoresSafeArea())
        .navigationTitle("ScoreView")
    }
}

struct ScoreDemoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScoreDemoView()
            ScoreDemoView().colorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
