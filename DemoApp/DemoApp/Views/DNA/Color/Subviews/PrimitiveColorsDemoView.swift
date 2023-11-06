import SwiftUI
import SATSCore

@available(iOS 16.0, *)
struct PrimitiveColorsView: View {
    @Binding var searchName: String
    @State var notice: Notice?

    var primitives: [ColorPrimitive] {
        if searchName.isEmpty {
            ColorPrimitive.allCases
        } else {
            ColorPrimitive.allCases.filter { primtive in
                primtive.name.contains(searchName) || primtive.rawValue.contains(searchName)
            }
        }
    }

    var body: some View {
        ScrollView {
            Grid(verticalSpacing: .spacingS) {
                ForEach(primitives, id: \.rawValue) { colorPrimitive in
                    GridRow {
                        SingleColorDemoView(primitive: colorPrimitive)
                            .cornerRadius(.cornerRadiusS)
                            .overlay(RoundedRectangle(cornerRadius: .cornerRadiusS).stroke())
                            .frame(height: 50)

                        Text(colorPrimitive.name)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .gridColumnAlignment(.leading)
                    }
                    .contextMenu(ContextMenu(menuItems: {
                        Button("Copy Hex", action: {
                            UIPasteboard.general.string = colorPrimitive.rawValue
                            notice = .success(message: "Copied color HEX code")
                        })
                        Button("Copy Full Description", action: {
                            let description = "\(colorPrimitive.name) = \(colorPrimitive.rawValue)"
                            UIPasteboard.general.string = description
                            notice = .success(message: "Copied description")
                        })
                    }))
                }
            }
            .padding(.horizontal, .spacingM)
        }
    }
}
