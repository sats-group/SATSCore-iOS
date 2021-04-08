import SwiftUI

struct TopBarDemoView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 100) {
                demoBar(title: "Solid style", style: .solid)

                ZStack(alignment: .top) {
                    Image("articlePageCover")
                        .resizable(resizingMode: .tile)
                        .frame(height: 230)

                    demoBar(title: "Transparent style", style: .transparent)
                }
            }
            .navigationTitle("SATSTopBarView")
        }
    }

    func demoBar(title: String, style: TopBarStyle) -> some View {
        let topBar = TopBar()
        topBar.addLeftButton(.backButton())
        topBar.addRightButton(.closeButton())
        topBar.configure(with: title, style: style)
        return DemoWrapperView(view: topBar)
            .frame(width: .infinity, height: 56)
    }
}

struct TopBarDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TopBarDemoView()
        }
    }
}
