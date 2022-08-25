import SwiftUI
import SATSCore

struct WheelPickerDemoView: View {
    @State private var minutes: Int = 12
    @State private var kilometers: Int = 0

    var body: some View {
        VStack(spacing: .spacingXXXL) {
            WheelPickerView(config: .minutes(label: "min"), value: $minutes)
            WheelPickerView(config: .kilometers(label: "km"), value: $kilometers)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.backgroundPrimary
        )
        .ignoresSafeArea()
    }
}

struct WheelPickerDemoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WheelPickerDemoView()

            WheelPickerDemoView()
                .preferredColorScheme(.dark)
        }
    }
}
