import SwiftUI

struct SemanticColorDefinition {
    let light: ColorPrimitive
    let dark: ColorPrimitive

    init(light: ColorPrimitive, dark: ColorPrimitive) {
        self.light = light
        self.dark = dark
    }

    init(both: ColorPrimitive) {
        self.light = both
        self.dark = both
    }

    var isFixed: Bool { light == dark }

    var color: Color { Color(uiColor: uiColor) }

    var uiColor: UIColor {
        #if os(watchOS)
        .init(hex: dark.rawValue)
        #else
        .init(dynamicProvider: { $0.userInterfaceStyle == .light ? light.uiColor : dark.uiColor })
        #endif
    }
}
