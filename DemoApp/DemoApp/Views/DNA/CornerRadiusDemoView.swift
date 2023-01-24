import SwiftUI
import SATSCore

struct CornerRadiusDemoView: View {
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            content(title: "cornerRadiusS", cornerRadius: .cornerRadiusS)
            content(title: "cornerRadiusM", cornerRadius: .cornerRadiusM)
            content(title: "cornerRadiusL", cornerRadius: .cornerRadiusL)
            Spacer()
        }
        .background(Color.backgroundSurfacePrimary)
        .navigationTitle("CornerRadius")
    }

    func content(title: String, cornerRadius: CGFloat) -> some View {
        HStack {
            Spacer()
            Text("\(title): \(cornerRadius, format: .number.rounded())")
                .multilineTextAlignment(.center)
            Spacer()
        }
        .font(.system(size: 16, weight: .bold))
        .padding(.vertical, 24)
        .background(Color.blue)
        .cornerRadius(cornerRadius)
        .foregroundColor(.white)
        .padding(.horizontal, 20)
    }
}

struct CornerRadiusDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CornerRadiusDemoView()
        }
    }
}
