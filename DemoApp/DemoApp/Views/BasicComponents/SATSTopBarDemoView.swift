import SwiftUI

struct SATSTopBarDemoView: View {
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
        }
    }

    func demoBar(title: String, style: SATSTopBarStyle) -> some View {
        let topBar = SATSTopBar()
        topBar.addLeftButton(type: .back, action: Selector(("someMethod")))
        topBar.addRightButton(type: .close, action: Selector(("someMethod")))
        topBar.configure(with: title, style: style)
        return DemoWrapperView(view: topBar)
            .frame(width: .infinity, height: 58)
    }
}

struct SATSTopBarDemoView_Previews: PreviewProvider {
    static var previews: some View {
        SATSTopBarDemoView()
    }
}
