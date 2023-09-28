import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("DNA")) {
                    NavigationLink("Fonts", destination: SwiftUIFontsDemoView())
                    NavigationLink("Colors", destination: ColorDemoView())
                    NavigationLink("Spacing", destination: SpacingDemoView())
                    NavigationLink("Corner Radius", destination: CornerRadiusDemoView())
                }

                Section(header: Text("UIKit Basics")) {
                    NavigationLink("SATSLabel (Legacy)", destination: SATSLabelLeagcyDemoView())
                    NavigationLink("SATSButton", destination: SATSButtonDemoView())
                }

                Section(header: Text("SwiftUI Basics")) {
                    NavigationLink("Button Styles", destination: SATSButtonSwftUIDemoView())
                    NavigationLink("Custom Async Image", destination: CustomAsyncDemoView())
                    NavigationLink("SATSCell", destination: SATSCellDemoView())
                    NavigationLink("Rewards Label", destination: RewardsTagDemoView())
                    NavigationLink("Tag", destination: TagDemoView())
                }

                Section(header: Text("Components")) {
                    Group {
                        NavigationLink("BannerImage", destination: BannerImageDemoView())
                        NavigationLink("BannerNotice", destination: BannerNoticeDemoView())
                        NavigationLink("DatePickerView", destination: DatePickerDemoView())
                        // To remove
                        NavigationLink("ErrorView", destination: ErrorDemoView())
                        NavigationLink("ModernErrorView", destination: ModernErrorDemoView())
                        NavigationLink("NoticeView", destination: NoticeDemoView())
                    }

                    Group {
                        NavigationLink("ProfilePictureView", destination: ProfilePictureDemoView())
                    }

                    Group {
                        NavigationLink("ScoreView", destination: ScoreDemoView())
                        NavigationLink("ScrollViewOffsetReader", destination: ScrollViewOffsetReaderDemoView())
                        NavigationLink("RadioGroup", destination: RadioGroupDemoView())
                        NavigationLink("WheelPickerView", destination: WheelPickerDemoView())
                    }
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("SATS Core Demo")

            Text("You can start by selecting a demo from the left side menu")
                .italic()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
