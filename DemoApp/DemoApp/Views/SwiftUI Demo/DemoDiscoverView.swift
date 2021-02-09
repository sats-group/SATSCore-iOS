import SwiftUI

/*

 To solve:

 - how to have multiple previews of themes in xcode previews
 - how to define color themes


 */

struct DemoDiscoverView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                DemoHeaderView()
                    .padding(.top, -16)
                    .padding(.horizontal, -16)

                // Top stories
                SampleTopStoriesView()
                    .background(Color.backgroundSecondary)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.2), radius: 21, x: 0, y: 5)

                Divider()

                ClassSampleView()

                ClassSampleView()

                Spacer()
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .background(
                Color.backgroundPrimary
                    .ignoresSafeArea()
            )
        }
        .background(
            Color.backgroundTopStart
                .ignoresSafeArea()
        )
    }
}

struct MainContainerView: View {
    var body: some View {
        TabView {
            DemoDiscoverView()
                .tabItem {
                    Image("tab-home")
                    Text("Home")
                }

            Color.backgroundPrimary
                .tabItem {
                    Image("tab-book")
                    Text("Book")
                }

            Color.backgroundPrimary
                .tabItem {
                    Image("tab-online")
                    Text("SATS anywhere")
                }

            Color.backgroundPrimary
                .tabItem {
                    Image("tab-profile")
                    Text("Me")
                }
        }
        .accentColor(.selection)
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Group {
                MainContainerView()
                    .previewDisplayName("Blue Light")

                MainContainerView()
                    .previewDisplayName("Blue Dark")
                    .colorScheme(.dark)
            }
            .environment(\.colorTheme, ColorTheme.blue)

            Group {
                MainContainerView()
                    .previewDisplayName("Gold Dark")

                MainContainerView()
                    .previewDisplayName("Gold Dark")
                    .colorScheme(.dark)
            }
            .environment(\.colorTheme, ColorTheme.gold)
        }
    }
}
