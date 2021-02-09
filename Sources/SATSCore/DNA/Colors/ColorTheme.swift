import UIKit

public struct ColorTheme {
    public let name: String

    public let buttonPrimary: UIColor
    public let buttonPrimaryHighlight: UIColor
    public let buttonPrimaryDisabled: UIColor

    public let selection: UIColor

    public let backgroundTopStart: UIColor
    public let backgroundTopEnd: UIColor
}

public extension ColorTheme {
    // MARK: Current theme

    static var current: ColorTheme = .blue

    // MARK: Theme definitions

    static let blue = ColorTheme(themeName: "blue")
    static let silver = ColorTheme(themeName: "silver")
    static let gold = ColorTheme(themeName: "gold")
    static let platinum = ColorTheme(themeName: "platinum")

    // MARK: Private methods

    private init(themeName: String) {
        self.init(
            name: themeName,
            buttonPrimary: Self.color("\(themeName)ButtonPrimary"),
            buttonPrimaryHighlight: Self.color("\(themeName)ButtonPrimaryHighlight"),
            buttonPrimaryDisabled: Self.color("\(themeName)ButtonPrimaryDisabled"),
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
