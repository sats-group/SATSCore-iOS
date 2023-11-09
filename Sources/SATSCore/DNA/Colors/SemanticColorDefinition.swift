import SwiftUI

public struct SemanticColorDefinition: CustomDebugStringConvertible {
    public let light: ColorPrimitive
    public let dark: ColorPrimitive

    public init(light: ColorPrimitive, dark: ColorPrimitive) {
        self.light = light
        self.dark = dark
    }

    public init(both: ColorPrimitive) {
        self.light = both
        self.dark = both
    }

    public var isFixed: Bool { light == dark }

    public var color: Color { Color(uiColor: uiColor) }

    public var uiColor: UIColor {
        #if os(watchOS)
        .init(hex: dark.rawValue)
        #else
        .init(dynamicProvider: { $0.userInterfaceStyle == .light ? light.uiColor : dark.uiColor })
        #endif
    }

    public var debugDescription: String {
        "[light: \(light)][dark: \(dark)]"
    }
}
