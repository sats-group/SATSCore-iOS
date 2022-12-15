import SwiftUI

struct ModernErrorDemoView: View {
    var body: some View {
        ModernErrorView(
            viewData: .init(
                title: "Ooops!",
                message: "Something went terribly wrong",
                canRetry: true
            )
        )
        .navigationTitle("ErrorView")
    }
}

struct ModernErrorDemoView_Previews: PreviewProvider {
    static var previews: some View {
        SATSFont.registerCustomFonts()
        return ModernErrorDemoView()
    }
}
