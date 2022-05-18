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
                    WeekDayLabel(name: helper.weekdayName(for: day))
                }
            }
        }
    }
}
