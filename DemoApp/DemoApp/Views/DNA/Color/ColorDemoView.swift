import SwiftUI
import SATSCore

@available(iOS 16.0, *)
struct ColorDemoView: View {
    @Environment(\.self) var environment
    @State var list: Int = 0
    @State var searchName: String = ""

    var body: some View {
        TabView(selection: $list) {
            SemanticColorsDemoView(searchName: $searchName)
                .tabItem { Text("Semantic Colors") }
                .tag(0)

            PrimitiveColorsView(searchName: $searchName)
                .tabItem { Text("Primitives") }
                .tag(1)
        }
        .listStyle(.insetGrouped)
        .searchable(text: $searchName, prompt: Text("Search by color name or hex code"))
        .safeAreaInset(edge: .top, content: {
            Picker("Section", selection: $list) {
                Text("Semantic").tag(0)
                Text("Primitives").tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, .spacingM)
        })
        .navigationTitle("Colors")
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

@available(iOS 16.0, *)
#Preview {
    NavigationStack {
        ColorDemoView()
    }
}
