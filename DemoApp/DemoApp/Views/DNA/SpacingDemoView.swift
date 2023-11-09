import SwiftUI
import SATSCore

struct SpacingDemoView: View {
    var body: some View {
        VStack {
            Spacer()
            Group {
                content(title: "spacingXXXS", spacing: .spacingXXXS)
                content(title: "spacingXXS", spacing: .spacingXXS)
                content(title: "spacingXS", spacing: .spacingXS)
                content(title: "spacingS", spacing: .spacingS)
                content(title: "spacingM", spacing: .spacingM)
                content(title: "spacingL", spacing: .spacingL)
                content(title: "spacingXL", spacing: .spacingXL)
                content(title: "spacingXXL", spacing: .spacingXXL)
                content(title: "spacingXXXL", spacing: .spacingXXXL)
            }
            Spacer()
        }
        .background(Color.surfacePrimary)
        .navigationTitle("Spacing")
    }

    func content(title: String, spacing: CGFloat) -> some View {
        HStack {
            Image(systemName: "arrow.left")
            Spacer()
            Text("\(title): \(spacing, format: .number.rounded())")
                .font(.caption)
                .multilineTextAlignment(.center)
            Spacer()
            Image(systemName: "arrow.right")
        }
        .font(.system(size: 16, weight: .bold))
        .padding(.vertical, 8)
        .background(Color.blue)
        .foregroundColor(.white)
        .padding(.horizontal, spacing)
    }
}

struct SpacerDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SpacingDemoView()
        }
    }
}
