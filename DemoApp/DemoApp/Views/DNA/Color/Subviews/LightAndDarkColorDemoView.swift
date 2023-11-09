import SwiftUI
import SATSCore

struct LightAndDarkColorDemoView: View {
    let color: SATSColorName

    var definition: SemanticColorDefinition {
        color.definition
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
