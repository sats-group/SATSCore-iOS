import SwiftUI

struct SectionHeaderDemoView: View {
    var body: some View {
        VStack(spacing: .spacingM) {
            SectionHeader(title: "Section")

            SectionHeader(title: "Section", actionView: SystemChevron.init, onClick: {})

            SectionHeader(title: "Section", actionView: {
                Picker("Section", selection: .constant("1")) {
                    Text("1")
                    Text("2")
                    Text("3")
                    Text("4")
                }
            })
        }
        .padding(.spacingM)
        .navigationTitle("Section Header")
    }
}

struct SectionHeaderDemoView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderDemoView()
    }
}
