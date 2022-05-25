import SwiftUI

extension DatePickerView {
    struct WeekDayLabel: View {
        let name: String

        var body: some View {
            Text(name)
                .frame(maxWidth: .infinity)
                .padding(.vertical, .spacingXXS)
                .satsFont(.small, weight: .emphasis)
                .foregroundColor(.onSurfaceDisabled)
        }
    }
}
