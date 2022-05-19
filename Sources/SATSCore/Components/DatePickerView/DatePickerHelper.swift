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

    private lazy var weekdayFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return dateFormatter
    }()

    func weekdayName(for date: Date) -> String {
        let stringValue: String

        if #available(iOS 15.0, *) {
            stringValue = date.formatted(.dateTime.weekday())
        } else {
            stringValue = weekdayFormatter.string(from: date)
        }

        return stringValue.prefix(1).uppercased()
    }
    /// Should be replaced when targeting iOS 15 with
    /// Text(date, format: .dateTime.day())
    func dateNotZeroPrefixed(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: date)
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
            if let availableDate = availableDays.first(where: { isSameDay(date1: day, date2: $0.date)}) {
                week.append(.init(date: availableDate.date, isOutsideOfRange: false, isActive: availableDate.isActive))
            } else {
                week.append(.init(date: day, isOutsideOfRange: true, isActive: false))
            }
        }

        return week
    }

    func circleBackgroundColor(date: Date, selectedDate: Date) -> Color {
        if isSameDay(date1: selectedDate, date2: date) {
            return .satsPrimary
        }
        if isToday(date: date) {
            return .satsPrimaryDisabled
        }
        return .clear
    }

    func dateTextColor(date: Date, selectedDate: Date, isActive: Bool) -> Color {
        if isSameDay(date1: selectedDate, date2: date) {
            return .onPrimary
        }
        if isActive {
            return .onSurfacePrimary
        }
        return .onSurfaceDisabled
    }

    func getWeek(for date: Date) -> [Date] {
        var mutableCalendar = calendar
        mutableCalendar.firstWeekday = 2
        let day = mutableCalendar.startOfDay(for: date)
        var week: [Date] = []
        if let weekInterval = mutableCalendar.dateInterval(of: .weekOfYear, for: day) {
            for counter in 0...6 {
                if let day = mutableCalendar.date(byAdding: .day, value: counter, to: weekInterval.start) {
                    week.append(day)
                }
            }
        }
        return week
    }

    private func isSameDay(date1: Date, date2: Date) -> Bool {
        calendar.isDate(date1, equalTo: date2, toGranularity: .day)
    }

    func isToday(date: Date) -> Bool {
        calendar.isDate(today(), equalTo: date, toGranularity: .day)
    }
}
