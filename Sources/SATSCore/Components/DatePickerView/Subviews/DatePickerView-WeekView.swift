import SwiftUI

extension DatePickerView {
    struct WeekViewData: Hashable {
        let date: Date
        let isOutsideOfRange: Bool
        let isActive: Bool
    }

    struct WeekView: View {
        @Binding var selectedDate: Date
        let days: [WeekViewData]
        let helper: DatePickerHelper

        init(
            selectedDate: Binding<Date>,
            days: [WeekViewData],
            helper: DatePickerHelper = .current
        ) {
            self._selectedDate = selectedDate
            self.days = days
            self.helper = helper
        }

        var body: some View {
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in
                    if day.isOutsideOfRange {
                        DayView(
                            day: helper.dateNotZeroPrefixed(date: day.date),
                            textColor: .onSurfaceDisabled,
                            backgroundColor: .clear
                        )
                    } else {
                        DayView(
                            day: helper.dateNotZeroPrefixed(date: day.date),
                            textColor: helper.dateTextColor(
                                date: day.date,
                                selectedDate: selectedDate,
                                isActive: day.isActive
                            ),
                            backgroundColor: helper.circleBackgroundColor(date: day.date, selectedDate: selectedDate)
                        )
                        .onTapGesture {
                            selectedDate = day.date
                        }
                    }
                }
            }
        }
    }
}
