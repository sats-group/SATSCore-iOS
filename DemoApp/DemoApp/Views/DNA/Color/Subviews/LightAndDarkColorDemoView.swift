import SwiftUI
// I'm using some internal types of the library for the demo
// that shouldn't be exposed in the library as public types
@testable import SATSCore

struct LightAndDarkColorDemoView: View {
    let color: SATSColorName

    var definition: SemanticColorDefinition {
        SATSColor.definition(for: color)
    }

    var body: some View {
        HStack(spacing: 0) {
            if definition.isFixed {
                SingleColorDemoView(primitive: definition.light)
            } else {
                SingleColorDemoView(primitive: definition.light)
                SingleColorDemoView(primitive: definition.dark)
            }
        }
        .frame(height: 50)
        .cornerRadius(.cornerRadiusS)
        .overlay(RoundedRectangle(cornerRadius: .cornerRadiusS).stroke())
    }
}
