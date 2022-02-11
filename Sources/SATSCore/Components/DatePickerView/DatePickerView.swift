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
    let viewData: [DatePickerViewData]

    public init(
        selectedDate: Binding<Date>,
        showFullCalendar: Binding<Bool>,
        viewData: [DatePickerViewData]
    ) {
        self._selectedDate = selectedDate
        self._showFullCalendar = showFullCalendar
        self.viewData = viewData
    }

    public var body: some View {
        VStack(spacing: 0) {
            WeekdaysView()
            if showFullCalendar {
                MonthView(
                    selectedDate: $selectedDate,
                    days: getCalendarDatesGroupedByMonths(dates: viewData)
                )
            } else {
                WeekView(selectedDate: $selectedDate, days: Self.getWeek(for: selectedDate, availableDates: viewData))
            }

            Button(action: {
                withAnimation(.easeInOut(duration: 0.2)) {
                    showFullCalendar.toggle()
                }
            }) {
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

    private func getCalendarDatesGroupedByMonths(dates: [DatePickerViewData]) -> [[DatePickerViewData]] {
        var months: [[DatePickerViewData]] = []
        var currentMonth: [DatePickerViewData] = []

        for date in dates {
            if Self.isFirstInMonth(date: date.date) {
                if !currentMonth.isEmpty {
                    months.append(currentMonth)
                    currentMonth = []
                }
            }
            currentMonth.append(date)
        }
        months.append(currentMonth)

        return months
    }
}
