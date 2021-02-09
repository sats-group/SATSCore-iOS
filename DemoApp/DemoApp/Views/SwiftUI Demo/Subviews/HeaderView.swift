import SwiftUI

struct DemoHeaderView: View {
    var body: some View {
        VStack(spacing: 16.0) {
            HStack(alignment: .center) {
                Image("sats-logo")
                    .foregroundColor(.white)
                Spacer()
                HStack(spacing: 24) {
                    Image("notification-bell")
                    Image("qr-code")
                }
            }

            HStack(alignment: .top, spacing: 24) {
                VStack(spacing: 4.0) {
                    Text("Discover")
                        .foregroundColor(.onButtonPrimary)
                    Color.selection
                        .frame(width: 46, height: 2)
                        .cornerRadius(1)
                }
                Text("Feed")
                Text("Clubs")

                Spacer()
            }
        }
        .font(.satsNavigationTitle())
        .foregroundColor(.onButtonPrimary)
        .padding(16)
        .background(backgroundHeader)
    }

    var backgroundHeader: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    Color.backgroundTopStart,
                    Color.backgroundTopEnd,
                ]
            ),
            startPoint: .top,
            endPoint: .bottom
        )
        .padding(.horizontal, -16)
        .ignoresSafeArea()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DemoHeaderView()
                .background(Color.backgroundTopStart)

            DemoHeaderView()
                .background(Color.backgroundTopStart)
                .environment(\.colorTheme, .silver)

            DemoHeaderView()
                .background(Color.backgroundTopStart)
                .colorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}

struct DemoHeaderSampleView: View {
    var body: some View {
        VStack {
            DemoHeaderView()
                .background(Color.backgroundTopStart)

            DemoHeaderView()
                .background(Color.backgroundTopStart)
                .environment(\.colorTheme, .silver)

            DemoHeaderView()
                .background(Color.backgroundTopStart)
                .colorScheme(.dark)
        }
    }
}
