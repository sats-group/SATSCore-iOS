import SwiftUI

extension DatePickerView {
    struct WeekdaysView: View {
        let helper: DatePickerHelper

        init(helper: DatePickerHelper = .current) {
            self.helper = helper
        }

        var body: some View {
            HStack(spacing: 0) {
                ForEach(helper.getWeekdays(), id: \.self) { day in
                        Text(weekdaySingleCharacter(date: day))
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.vertical, .spacingXXS)
            .satsFont(.small, weight: .emphasis)
            .foregroundColor(.onSurfaceDisabled)
        }

        // Should be replaced when targeting iOS 15 with
        // Text(date, format: .dateTime.weekday(.narrow))
        private func weekdaySingleCharacter(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E"
            return dateFormatter.string(from: date).prefix(1).uppercased()
        }
    }
}
