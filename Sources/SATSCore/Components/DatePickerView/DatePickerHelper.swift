import SwiftUI

public class DatePickerHelper {
    public static let current: DatePickerHelper = .init()

    let calendar: Calendar
    public let today: () -> Date

    public init(
        calendar: Calendar = .current,
        today: @escaping () -> Date = { Date() }
    ) {
        self.calendar = calendar
        self.today = today
    }

    private lazy var dayNumberFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter
    }()

    private lazy var dateOnlyFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()

    /// Returns a string that is only the day/month/year components for a date
    func dateId(for date: Date) -> String {
        dateOnlyFormatter.string(from: date)
    }

    func weekdayName(for date: Date) -> String {
        let stringValue = date.formatted(.dateTime.weekday())
        return stringValue.prefix(1).uppercased()
    }

    func dateNotZeroPrefixed(date: Date) -> String {
        dayNumberFormatter.string(from: date)
    }

    func isFirstInMonth(date: Date) -> Bool {
        calendar.dateComponents([.day], from: date).day == 1
    }

    func getWeekdays() -> [Date] {
        getWeek(for: today())
    }

    func getWeek(for date: Date, availableDays: [DatePickerViewData]) -> [DatePickerView.WeekViewData] {
        let weekdays = getWeek(for: date)
        var week: [DatePickerView.WeekViewData] = []

        for day in weekdays {
            if let availableDate = availableDays.first(where: { isSameDay(date1: day, date2: $0.date) }) {
                week.append(.init(date: availableDate.date, isOutsideOfRange: false, isActive: availableDate.isActive))
            } else {
                week.append(.init(date: day, isOutsideOfRange: true, isActive: false))
            }
        }

        return week
    }

    func circleBackgroundColor(date: Date, selectedDate: Date) -> Color {
        circleBackgroundColor(date: date, isSelected: isSameDay(date1: selectedDate, date2: date))
    }

    func circleBackgroundColor(date: Date, isSelected: Bool) -> Color {
        if isSelected {
            return .primaryButton
        }
        if isToday(date: date) {
            return .primaryButtonDisabled
        }
        return .clear
    }

    func dateTextColor(date: Date, selectedDate: Date, isActive: Bool) -> Color {
        dateTextColor(
            date: date,
            isSelected: isSameDay(date1: selectedDate, date2: date),
            isActive: isActive
        )
    }

    func dateTextColor(date: Date, isSelected: Bool, isActive: Bool) -> Color {
        if isSelected {
            return .onPrimaryButton
        }
        if isActive {
            return .onSurfacePrimary
        }
        return .onSurfacePrimaryDisabled
    }

    func getWeek(for date: Date) -> [Date] {
        var mutableCalendar = calendar
        mutableCalendar.firstWeekday = 2
        let day = mutableCalendar.startOfDay(for: date)
        var week: [Date] = []
        if let weekInterval = mutableCalendar.dateInterval(of: .weekOfYear, for: day) {
            for counter in 0 ... 6 {
                if let day = mutableCalendar.date(byAdding: .day, value: counter, to: weekInterval.start) {
                    week.append(day)
                }
            }
        }
        return week
    }

    func isSameDay(date1: Date, date2: Date) -> Bool {
        calendar.isDate(date1, equalTo: date2, toGranularity: .day)
    }

    func isToday(date: Date) -> Bool {
        calendar.isDate(today(), equalTo: date, toGranularity: .day)
    }
}
