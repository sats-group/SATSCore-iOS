import SwiftUI

struct SATSColor {}

public struct SemanticColorDefinition {
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
        .init(dynamicProvider: { traitCollection in
        traitCollection.userInterfaceStyle == .light ? light.uiColor : light.uiColor
        })
        #endif
    }
}

public extension Color {
    static var sats: SATSColorSwiftUI = .init()
}

@dynamicMemberLookup
public struct SATSColorSwiftUI {
    public func definition(for colorName: SATSColorName) -> SemanticColorDefinition {
        guard let definition = SATSColor.definitions[colorName] else {
            fatalError("❌ no definition found for \(colorName.rawValue)")
        }

        return definition
    }

    public subscript(dynamicMember colorName: String) -> Color {
        guard let satsColorName = SATSColorName(rawValue: colorName) else {
            fatalError("❌ no definition found for \(colorName)")
        }

        return definition(for: satsColorName).color
    }
}

import UIKit

public extension UIColor {
    static var sats: SATSColorUIKit = .init()
}

@dynamicMemberLookup
public struct SATSColorUIKit {
    public func definition(for colorName: SATSColorName) -> SemanticColorDefinition {
        guard let definition = SATSColor.definitions[colorName] else {
            fatalError("❌ no definition found for \(colorName.rawValue)")
        }

        return definition
    }

    public subscript(dynamicMember colorName: String) -> UIColor {
        guard let satsColorName = SATSColorName(rawValue: colorName) else {
            fatalError("❌ no definition found for \(colorName)")
        }

        return definition(for: satsColorName).uiColor
    }
}
