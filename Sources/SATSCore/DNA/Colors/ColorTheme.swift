import UIKit

/// Collection of colors that define a color theme for the app
public struct ColorTheme: Hashable {
    public let name: Name

    public let primary: UIColor
    public let primaryHighlight: UIColor
    public let primaryDisabled: UIColor

    public let selection: UIColor

    public let backgroundTopStart: UIColor
    public let backgroundTopEnd: UIColor

    public let navigation: UIColor

    /// Given an static color name, return the appropriate value from the theme
    subscript(index: ColorName) -> UIColor? {
        switch index {
        case .primary: return primary
        case .primaryHighlight: return primaryHighlight
        case .primaryDisabled: return primaryDisabled
        case .selection: return selection
        case .backgroundTopStart: return backgroundTopStart
        case .backgroundTopEnd: return backgroundTopEnd
        case .navigation: return navigation
        default:
            return nil
        }
    }
}

public extension ColorTheme {
    enum Name: String, Equatable, Hashable, Identifiable, CaseIterable {
        case blue
        case silver
        case gold
        case platinum

        public var id: String { rawValue }

        public var titleName: String {
            switch self {
            case .blue: return "Blue"
            case .silver: return "Silver"
            case .gold: return "Gold"
            case .platinum: return "Platinum"
            }
        }
    }

    /// General notifications consumers of the color theme can emit when chaning it
    static let themeChangedNotification = NSNotification.Name(rawValue: "SATSCore_themeChangedNotification")
}

public extension ColorTheme {
    // MARK: Current theme

    static var current: ColorTheme = .blue

    // MARK: Theme definitions

    static var blue: ColorTheme { ColorTheme(themeName: .blue) }
    static var silver: ColorTheme { ColorTheme(themeName: .silver) }
    static var gold: ColorTheme { ColorTheme(themeName: .gold) }
    static var platinum: ColorTheme { ColorTheme(themeName: .platinum) }

    static func color(_ name: String, for themeName: ColorTheme.Name) -> UIColor {
        let colorName = "\(themeName.rawValue)\(name)"
        guard let color = UIColor(named: colorName, in: .module, compatibleWith: nil) else {
            preconditionFailure("❌ \(name) color not found for \(themeName.rawValue)!")
        }

        return color
    }

    static func from(name: ColorTheme.Name) -> ColorTheme {
        switch name {
        case .blue: return .blue
        case .silver: return .silver
        case .gold: return .gold
        case .platinum: return .platinum
        }
    }

    // MARK: Private methods

    private init(themeName: ColorTheme.Name) {
        self.init(
            name: themeName,
            primary: Self.color("Primary", for: themeName),
            primaryHighlight: Self.color("PrimaryHighlight", for: themeName),
            primaryDisabled: Self.color("PrimaryDisabled", for: themeName),
            selection: Self.color("Selection", for: themeName),
            backgroundTopStart: Self.color("GradientStart", for: themeName),
            backgroundTopEnd: Self.color("GradientEnd", for: themeName),
            navigation: Self.color("Navigation", for: themeName)
        )
    }
}
