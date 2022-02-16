import SwiftUI

public struct DatePickerViewData: Hashable {
    let date: Date
    let isActive: Bool

    public init(date: Date, isActive: Bool) {
        self.date = date
        self.isActive = isActive
    }
}

public struct DatePickerView: View {
    @Binding var selectedDate: Date
    @Binding var showFullCalendar: Bool
    let days: [DatePickerViewData]
    let helper: DatePickerHelper

    public init(
        selectedDate: Binding<Date>,
        showFullCalendar: Binding<Bool>,
        days: [DatePickerViewData],
        helper: DatePickerHelper = .current
    ) {
        self._selectedDate = selectedDate
        self._showFullCalendar = showFullCalendar
        self.days = days
        self.helper = helper
    }

    public var body: some View {
        VStack(spacing: 0) {
            WeekdaysView()
            if showFullCalendar {
                MonthView(
                    selectedDate: $selectedDate,
                    days: getCalendarDaysGroupedByMonths(days: days)
                )
            } else {
                WeekView(selectedDate: $selectedDate, days: helper.getWeek(for: selectedDate, availableDays: days))
            }

            Button(action: toggleFullView) {
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 50, height: 4)
                    .padding(8)
                .foregroundColor(.border)
            }
        }
        .background(Color.backgroundPrimary)
        .foregroundColor(.onBackgroundPrimary)
        .satsFont(.small)
    }

    private func toggleFullView() {
        withAnimation(.easeInOut(duration: 0.2)) {
            showFullCalendar.toggle()
        }
    }

    private func getCalendarDaysGroupedByMonths(days: [DatePickerViewData]) -> [[DatePickerViewData]] {
        var months: [[DatePickerViewData]] = []
        var currentMonth: [DatePickerViewData] = []

        for day in days {
            if helper.isFirstInMonth(date: day.date) {
                if !currentMonth.isEmpty {
                    months.append(currentMonth)
                    currentMonth = []
                }
            }
            currentMonth.append(day)
        }
        months.append(currentMonth)

        return months
    }
}
