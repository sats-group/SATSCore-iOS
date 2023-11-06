import SwiftUI
import SATSCore

struct SingleColorDemoView: View {
    let primitive: ColorPrimitive

    var body: some View {
        primitive
            .color
            .overlay {
                Text(primitive.rawValue)
                    .font(.caption2)
                    .foregroundColor(.white)
                    .frame(alignment: .bottomLeading)
                    .padding(.spacingXXS)
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(4)
                    .padding(.spacingXS)
            }
    }
}
