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
                    NavigationLink("SATSLabel", destination: SATSLabelDemoView())
                    NavigationLink("SATSButton", destination: SATSButtonDemoView())
                }

                Section(header: Text("SwiftUI Basics")) {
                    NavigationLink("Button Styles", destination: SATSButtonSwftUIDemoView())
                    NavigationLink("Custom Async Image", destination: CustomAsyncDemoView())
                    NavigationLink("SATSCell", destination: SATSCellDemoView())
                }

                Section(header: Text("Components")) {
                    Group {
                        NavigationLink("BannerImage", destination: BannerImageDemoView())
                        NavigationLink("DatePickerView", destination: DatePickerDemoView())
                        NavigationLink("EmptyStateView", destination: EmptyStateDemoView())
                        NavigationLink("ErrorView", destination: ErrorDemoView())
                        NavigationLink("GradientView", destination: GradientDemoView())
                        NavigationLink("LoadingView", destination: LoadingDemoView())
                        NavigationLink("ModernErrorView", destination: ModernErrorDemoView())
                        NavigationLink("NoticeView", destination: NoticeDemoView())
                    }

                    Group {
                        NavigationLink("RoundLoadingView", destination: RoundLoadingDemoView())
                        NavigationLink("ScoreView", destination: ScoreDemoView())
                        NavigationLink("ScrollViewOffsetReader", destination: ScrollViewOffsetReaderDemoView())
                        NavigationLink("TabSelectionView", destination: TabSelectionDemoView())
                        NavigationLink("TopBar", destination: TopBarDemoView())
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
