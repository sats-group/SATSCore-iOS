import SwiftUI

struct SampleTopStoriesView: View {
    var body: some View {
        VStack(spacing: 24.0) {
            HStack(alignment: .top, spacing: 24.0) {
                DateView(day: "20", month: "Oct")

                VStack(spacing: 16.0) {
                    BookingView(
                        time: "17:30",
                        duration: "30 min",
                        title: "Cycling Intervals",
                        club: "Carl Berner"
                    )

                    BookingView(
                        time: "18:30",
                        duration: "30 min",
                        title: "Yoga",
                        club: "Carl Berner"
                    )
                }
            }

            HStack(alignment: .top, spacing: 24.0) {
                DateView(day: "21", month: "Oct")

                VStack {
                    BookingView(
                        time: "07:30",
                        duration: "30 min",
                        title: "Yoga",
                        club: "Carl Berner"
                    )
                }
            }
        }
        .padding(20)
    }
}

struct SampleTopStoriesView_Previews: PreviewProvider {
    static var previews: some View {
        SampleTopStoriesView()
    }
}

extension SampleTopStoriesView {
    struct BookingView: View {
        let time: String
        let duration: String
        let title: String
        let club: String

        var body: some View {
            HStack(spacing: 20.0) {
                VStack(alignment: .leading) {
                    Text(time)
                    Text(duration)
                        .foregroundColor(.onBackgroundPrimarySecondary)
                        .font(.satsSmall())
                }

                VStack(alignment: .leading) {
                    Text(title)
                    Text(club)
                        .foregroundColor(.onBackgroundPrimarySecondary)
                        .font(.satsSmall())
                }

                Spacer()

                Text("4")
                    .foregroundColor(.onButtonPrimary)
                    .font(.satsSmall())
                    .frame(width: 18, height: 18)
                    .background(Color.waitlist)
                    .cornerRadius(9)
            }
            .foregroundColor(.onBackgroundPrimary)
            .font(.satsBasic())
        }
    }
}

extension SampleTopStoriesView {
    struct DateView: View {
        let day: String
        let month: String

        var body: some View {
            VStack(alignment: .leading) {
                Text(day)
                    .font(.satsLarge())
                Text(month)
                    .font(.satsSmall())
            }
            .foregroundColor(.onBackgroundPrimary)
        }
    }
}
