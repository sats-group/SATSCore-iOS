import SwiftUI

extension DatePickerView {
    /// Should be replaced when targeting iOS 15 with
    /// Text(date, format: .dateTime.day())
    static func dateNotZeroPrefixed(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: date)
    }

    static func isFirstInMonth(date: Date) -> Bool {
        Calendar.current.dateComponents([.day], from: date).day == 1
    }

    static func getWeekdays() -> [Date] {
        getWeek(for: Date())
    }

    static func getWeek(for date: Date, availableDates: [DatePickerViewData]) -> [DatePickerView.WeekViewData] {
        let weekdays = getWeek(for: date)
        var week: [DatePickerView.WeekViewData] = []

        for day in weekdays {
            if let availableDate = availableDates.first(where: { isSameDay(date1: day, date2: $0.date)}) {
                week.append(.init(date: availableDate.date, isOutsideOfRange: false, isActive: availableDate.isActive))
            } else {
                week.append(.init(date: day, isOutsideOfRange: true, isActive: false))
            }
        }

        return week
    }

    static func circleBackgroundColor(date: Date, selectedDate: Date) -> Color {
        if isSameDay(date1: selectedDate, date2: date) {
            return .satsPrimary
        }
        if isToday(date: date) {
            return .satsPrimaryDisabled
        }
        return .clear
    }

    static func dateTextColor(date: Date, selectedDate: Date, isActive: Bool) -> Color {
        if isSameDay(date1: selectedDate, date2: date) {
            return .onPrimary
        }
        if isActive {
            return .onBackgroundPrimary
        }
        return .onBackgroundDisabled
    }

    private static func getWeek(for date: Date) -> [Date] {
        var calendar = Calendar.current
        calendar.firstWeekday = 2
        let day = calendar.startOfDay(for: date)
        var week: [Date] = []
        if let weekInterval = calendar.dateInterval(of: .weekOfYear, for: day) {
            for counter in 0...6 {
                if let day = calendar.date(byAdding: .day, value: counter, to: weekInterval.start) {
                    week.append(day)
                }
            }
        }
        return week
    }

    private static func isSameDay(date1: Date, date2: Date) -> Bool {
        Calendar.current.isDate(date1, equalTo: date2, toGranularity: .day)
    }

    private static func isToday(date: Date) -> Bool {
        Calendar.current.isDate(Date(), equalTo: date, toGranularity: .day)
    }
}
