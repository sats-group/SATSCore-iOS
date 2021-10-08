import SwiftUI

struct TopBarDemoView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                demoBar(title: "Solid style", style: .solid)

                ZStack(alignment: .top) {
                    Image("articlePageCover")
                        .resizable(resizingMode: .tile)
                        .frame(height: 230)

                    demoBar(title: "Transparent, floating", style: .transparent, isFloating: true)
                }
            }
            .navigationTitle("SATSTopBarView")
        }
    }

    func demoBar(title: String, style: TopBarStyle, isFloating: Bool = false) -> some View {
        let topBar = TopBar()
        if isFloating {
            topBar.addLeftButton(.backFloatingButton())
            topBar.addRightButton(.closeFloatingButton())
        } else {
            topBar.addLeftButton(.backButton())
            topBar.addRightButton(.closeButton())
        }
        topBar.configure(with: title, style: style)
        return DemoWrapperView(view: topBar)
            .frame(width: .infinity, height: 56)
    }
}

struct TopBarDemoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                TopBarDemoView()
            }
 
            NavigationView {
                TopBarDemoView()
            }.preferredColorScheme(.dark)
        }
    }
}
