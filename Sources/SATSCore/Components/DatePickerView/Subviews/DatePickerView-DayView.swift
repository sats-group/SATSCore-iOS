import SwiftUI

extension DatePickerView {
    struct DayView: View {
        let day: String
        let textColor: Color
        let backgroundColor: Color

        var body: some View {
            Text(day)
                .frame(height: 42)
                .background(
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundColor(backgroundColor)
                )
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity)
        }
    }
}
