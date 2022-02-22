import SwiftUI

extension DatePickerView {
    struct MonthView: View {
        @Binding var selectedDate: Date
        let days: [[DatePickerViewData]]
        let helper: DatePickerHelper

        init(
            selectedDate: Binding<Date>,
            days: [[DatePickerViewData]],
            helper: DatePickerHelper = .current
        ) {
            self._selectedDate = selectedDate
            self.days = days
            self.helper = helper
        }

        private let sevenColumnGrid = Array(repeating: GridItem(.flexible(), spacing: 0), count: 7)

        var body: some View {
            ScrollViewReader { scrollView in
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(days, id: \.self) { daysInMonth in
                            if helper.isFirstInMonth(date: daysInMonth[0].date) {
                                Text(monthFull(date: daysInMonth[0].date))
                                    .satsFont(.small, weight: .emphasis)
                                    .foregroundColor(.onSurfaceSecondary)
                                    .padding(.vertical, .spacingXXS)
                            }
                            LazyVGrid(columns: sevenColumnGrid, spacing: 0) {
                                ForEach(0 ..< getNumberOfEmptySpaces(date: daysInMonth[0].date), id: \.self) { _ in
                                    Color.clear
                                }
                                ForEach(daysInMonth, id: \.self) { day in
                                    DayView(
                                        day: helper.dateNotZeroPrefixed(date: day.date),
                                        textColor: helper.dateTextColor(
                                            date: day.date,
                                            selectedDate: selectedDate,
                                            isActive: day.isActive
                                        ),
                                        backgroundColor: helper.circleBackgroundColor(
                                            date: day.date,
                                            selectedDate: selectedDate
                                        )
                                    )
                                    .onTapGesture {
                                        selectedDate = day.date
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(maxHeight: 200)
                .onAppear {
                    guard let selectedItem = days.flatMap({ $0 }).first(where: { selectedDate == $0.date }) else {
                        return
                    }
                    scrollView.scrollTo(selectedItem, anchor: .bottom)
                }
            }
        }

        private func getNumberOfEmptySpaces(date: Date) -> Int {
            let day = Calendar.current.dateComponents([.weekday], from: date)
            guard let weekday = day.weekday else { return -1 }

            return weekday == 1 ? 6 : weekday - 2
        }

        // Should be replaced when targeting iOS 15 with
        // Text(datesInMonth[0], format: .dateTime.month(.wide))
        private func monthFull(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM"
            return dateFormatter.string(from: date).capitalized
        }
    }
}
