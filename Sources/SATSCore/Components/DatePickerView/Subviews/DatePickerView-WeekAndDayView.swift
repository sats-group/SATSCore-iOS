import SwiftUI

extension DatePickerView {
    struct WeekAndDayView: View {
        let viewData: DatePickerViewData
        let isSelected: Bool
        let helper: DatePickerHelper

        init(
            viewData: DatePickerViewData,
            isSelected: Bool,
            helper: DatePickerHelper = .current
        ) {
            self.viewData = viewData
            self.isSelected = isSelected
            self.helper = helper
        }

        var body: some View {
            VStack(spacing: 0) {
                weekDay
                dayNumber
            }
        }

        var weekDay: some View {
            DatePickerView.WeekDayLabel(name: helper.weekdayName(for: viewData.date))
        }

        @ViewBuilder var dayNumber: some View {
            DatePickerView.DayView(
                day: helper.dateNotZeroPrefixed(date: viewData.date),
                textColor: helper.dateTextColor(
                    date: viewData.date,
                    isSelected: isSelected,
                    isActive: viewData.isActive
                ),
                backgroundColor: helper.circleBackgroundColor(
                    date: viewData.date,
                    isSelected: isSelected
                )
            )
        }
    }
}
