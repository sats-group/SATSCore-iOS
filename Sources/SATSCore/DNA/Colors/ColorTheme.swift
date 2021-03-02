import UIKit

/// Collection of colors that define a color theme for the app
public struct ColorTheme: Hashable {
    public let name: String

    public let primary: UIColor
    public let primaryHighlight: UIColor
    public let primaryDisabled: UIColor

    public let selection: UIColor

    public let backgroundTopStart: UIColor
    public let backgroundTopEnd: UIColor

    /// Given an static color name, return the appropriate value from the theme
    subscript(index: ColorName) -> UIColor? {
        switch index {
        case .primary: return primary
        case .primaryHighlight: return primaryHighlight
        case .primaryDisabled: return primaryDisabled
        case .selection: return selection
        case .backgroundTopStart: return backgroundTopStart
        case .backgroundTopEnd: return backgroundTopEnd
        default:
            return nil
        }
    }
}

public extension ColorTheme {
    // MARK: Current theme

    static var current: ColorTheme = .blue

    // MARK: Theme definitions

    static var blue: ColorTheme { ColorTheme(themeName: "blue") }
    static var silver: ColorTheme { ColorTheme(themeName: "silver") }
    static var gold: ColorTheme { ColorTheme(themeName: "gold") }
    static var platinum: ColorTheme { ColorTheme(themeName: "platinum") }

    // MARK: Private methods

    private init(themeName: String) {
        self.init(
            name: themeName,
            primary: Self.color("\(themeName)Primary"),
            primaryHighlight: Self.color("\(themeName)PrimaryHighlight"),
            primaryDisabled: Self.color("\(themeName)PrimaryDisabled"),
            selection: Self.color("\(themeName)Selection"),
            backgroundTopStart: Self.color("\(themeName)GradientStart"),
            backgroundTopEnd: Self.color("\(themeName)GradientEnd")
        )
    }

    private static func color(_ name: String) -> UIColor {
        guard let color = UIColor(named: name, in: .module, compatibleWith: nil) else {
            preconditionFailure("❌ \(name) color not found!")
        }

        return color
    }
}
