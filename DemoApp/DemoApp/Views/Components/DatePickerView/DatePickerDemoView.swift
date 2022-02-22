import SwiftUI
import SATSCore

struct DatePickerDemoView: View {
    @State var selectedDate: Date = Date()
    @State var showFullCalendar: Bool = false

    var body: some View {
        ScrollView {
            DatePickerView(
                selectedDate: $selectedDate,
                showFullCalendar: $showFullCalendar,
                days: generatePlaceholderDays()
            )
        }
        .frame(height: 300)
        .background(Color.backgroundPrimary)
    }

    private func generatePlaceholderDays() -> [DatePickerViewData] {
        var dates: [DatePickerViewData] = []
        for day in 0...60 {
            let date = Date().addingTimeInterval(dayDurationInSeconds * Double(day))
            let isActive = day % 3 > 0
            dates.append(.init(date: date, isActive: isActive))
        }

        return dates
    }

    private var dayDurationInSeconds: TimeInterval {
        60*60*24
    }
}

struct DatePickerDemoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DatePickerDemoView()
                .previewLayout(.sizeThatFits)

            DatePickerDemoView()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)

            DatePickerDemoView()
                .environment(\.sizeCategory, .extraExtraExtraLarge)
                .previewLayout(.sizeThatFits)

            DatePickerDemoView(showFullCalendar: true)
                .previewLayout(.sizeThatFits)

            DatePickerDemoView(showFullCalendar: true)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)

            DatePickerDemoView(showFullCalendar: true)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
                .previewLayout(.sizeThatFits)
        }
    }
}
