import SwiftUI

extension DatePickerView {
    /// An alternative date picker intended for a horizontal scrolling list
    public struct HorizontalDaysList: View {
        @Binding var selectedDate: Date
        let availableDates: [DatePickerViewData]
        let helper: DatePickerHelper

        public init(
            selectedDate: Binding<Date>,
            availableDates: [DatePickerViewData],
            helper: DatePickerHelper = .current
        ) {
            self._selectedDate = selectedDate
            self.availableDates = availableDates
            self.helper = helper
        }

        public var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { proxy in
                    HStack(spacing: 0) {
                        ForEach(availableDates, id: \.self) { viewData in
                            dayView(for: viewData)
                                .onTapGesture { selectedDate = viewData.date }
                                .id(helper.dateId(for: viewData.date))
                        }
                    }
                    .padding(.vertical, .spacingM)
                    .satsFont(.small)
                    .onChange(of: selectedDate) { newValue in
                        scroll(with: proxy, to: newValue)
                    }
                }
            }
            .background(Color.backgroundPrimary)
        }

        func dayView(for viewData: DatePickerViewData) -> some View {
            DatePickerView.WeekAndDayView(
                viewData: viewData,
                isSelected: helper.isSameDay(date1: viewData.date, date2: selectedDate),
                helper: helper
            )
            .frame(minWidth: 32)
            .padding(.horizontal, .spacingS)
        }

        func scroll(with proxy: ScrollViewProxy, to date: Date) {
            withAnimation(.easeInOut) {
                proxy.scrollTo(helper.dateId(for: date))
            }
        }
    }
}
