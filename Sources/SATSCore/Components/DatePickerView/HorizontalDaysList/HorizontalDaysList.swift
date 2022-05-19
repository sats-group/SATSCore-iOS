import SwiftUI

extension DatePickerView {
    /// An alternative date picker intended for a horizontal scrolling list
    public struct HorizontalDaysList: View {
        @Binding var selectedDate: Date
        @State var availableDates: [DatePickerViewData]
        let helper: DatePickerHelper

        public init(
            selectedDate: Binding<Date>,
            availableDates: [DatePickerViewData],
            helper: DatePickerHelper = .current
        ) {
            self._selectedDate = selectedDate
            self._availableDates = .init(initialValue: availableDates)
            self.helper = helper
        }

        public var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .spacingL) {
                    ForEach(availableDates, id: \.self) { date in
                        dayView(for: date)
                            .onTapGesture { selectedDate = date.date }
                    }
                }
                .padding(.spacingM)
                .satsFont(.small)
            }
            .background(Color.backgroundPrimary)
        }

        func dayView(for viewData: DatePickerViewData) -> some View {
            DatePickerView.WeekAndDayView(
                viewData: viewData,
                isSelected: helper.isSameDay(date1: viewData.date, date2: selectedDate),
                helper: helper
            )
            .frame(width: 32)
        }
    }
}
