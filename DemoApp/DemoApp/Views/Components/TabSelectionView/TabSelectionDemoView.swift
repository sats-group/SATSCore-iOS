import SwiftUI

struct TabSelectionDemoView: View {
    @State var value: Int = 2

    var body: some View {
        VStack {
            Spacer()
            TabSelectionView(
                selectedValue: $value,
                options: ["Group class", "PT Session", "Treatments"]
            )
                .background(Color.white)
            Spacer()
        }
        .background(Color.backgroundPrimary)
        .navigationBarTitle("TabSelectionView")
    }
}

struct TabSelectionDemoView_Previews: PreviewProvider {
    static var previews: some View {
        TabSelectionDemoView()
    }
}
