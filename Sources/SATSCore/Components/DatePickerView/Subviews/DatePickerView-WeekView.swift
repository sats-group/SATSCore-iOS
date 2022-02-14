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

        var body: some View {
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in
                    if day.isOutsideOfRange {
                        DayView(
                            day: dateNotZeroPrefixed(date: day.date),
                            textColor: .onBackgroundDisabled,
                            backgroundColor: .clear
                        )
                    } else {
                        DayView(
                            day: dateNotZeroPrefixed(date: day.date),
                            textColor: dateTextColor(
                                date: day.date,
                                selectedDate: selectedDate,
                                isActive: day.isActive
                            ),
                            backgroundColor: circleBackgroundColor(date: day.date, selectedDate: selectedDate)
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
