import SwiftUI
import SATSCore

class SemanticColorsDemoViewModel: ObservableObject {
    @Published var colorNames: [SATSColorName] = SATSColorName.allCases
    @Published var notice: Notice?

    func filter(with searchText: String) {
        guard !searchText.isEmpty else {
            colorNames = SATSColorName.allCases
            return
        }

        let fixedSearch = searchText.lowercased()

        colorNames = SATSColorName.allCases.filter { colorName in
            let definition = Color.sats.definition(for: colorName)

            return colorName.rawValue.lowercased().contains(fixedSearch) ||
            definition.light.rawValue.lowercased().contains(fixedSearch) ||
            definition.dark.rawValue.lowercased().contains(fixedSearch)
        }
    }

    func copyLightHex(for colorName: SATSColorName) {
        let definition = Color.sats.definition(for: colorName)
        UIPasteboard.general.string = definition.light.rawValue
        notice = .success(message: "\(definition.light.rawValue) copied to your clipboard")
    }

    func copyDarkHex(for colorName: SATSColorName) {
        let definition = Color.sats.definition(for: colorName)
        UIPasteboard.general.string = definition.dark.rawValue
        notice = .success(message: "\(definition.dark.rawValue) copied to your clipboard")
    }

    func copyFullDescription(for colorName: SATSColorName) {
        let definition = Color.sats.definition(for: colorName)
        UIPasteboard.general.string = "\(colorName) = [light: \(definition.light)][dark: \(definition.dark)]"
        notice = .success(message: "\(colorName)'s description copied")
    }
}

struct SemanticColorsDemoView: View {
    @StateObject var viewModel: SemanticColorsDemoViewModel = .init()
    @Environment(\.horizontalSizeClass) var horizontalSize // TODO
    @Binding var searchName: String

    var body: some View {
        List {
            if viewModel.colorNames.isEmpty {
                Text("No results for **\(searchName)**")
            } else {
                semanticColors
            }
        }
        .inlineNotice($viewModel.notice, edge: .bottom)
        .listStyle(.plain)
        .onChange(of: searchName, perform: viewModel.filter(with:))
        .safeAreaInset(edge: .top) { headerView }
    }

    @ViewBuilder var semanticColors: some View {
        searchResultsBadge

        ForEach(viewModel.colorNames, id: \.rawValue) { colorName in
            VStack(alignment: .leading, spacing: .spacingXXS) {
                Text(colorName.rawValue).bold()
                LightAndDarkColorDemoView(color: colorName)
            }
            .listRowSeparator(.hidden)
            .contextMenu(ContextMenu(menuItems: {
                Button("☀️ Copy Light HEX", action: { viewModel.copyLightHex(for: colorName) })
                Button("🌒 Copy Dark HEX", action: { viewModel.copyDarkHex(for: colorName) })
                Button("🎨 Copy Full Description", action: { viewModel.copyFullDescription(for: colorName) })
            }))
        }
    }

    var headerView: some View {
        HStack {
            Text("☀️ Light")
                .frame(maxWidth: .infinity)

            Text("🌒 Dark")
                .frame(maxWidth: .infinity)
        }
        .font(.caption)
        .padding(.vertical, .spacingXS)
        .background(Material.thick)
    }

    @ViewBuilder var searchResultsBadge: some View {
        if !searchName.isEmpty {
            Text("\(viewModel.colorNames.count) results")
                .font(.caption)
                .italic()
                .padding(.vertical, .spacingXXS)
                .padding(.horizontal, .spacingM)
                .background(Capsule().foregroundStyle(Material.thick))
                .frame(maxWidth: .infinity)
                .listRowSeparator(.hidden)
        }
    }
}
