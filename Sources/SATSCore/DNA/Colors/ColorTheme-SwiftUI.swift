#if canImport(SwiftUI)
import SwiftUI

/// In order to use the ColorTheme with SwiftUI as an environment variable, we can use this key
public struct ColorThemeEnvironmentKey: EnvironmentKey {
    public static let defaultValue: ColorTheme = ColorTheme.current
}

public extension EnvironmentValues {
    var colorTheme: ColorTheme {
        get { return self[ColorThemeEnvironmentKey.self] }
        set { self[ColorThemeEnvironmentKey.self] = newValue }
    }
}
#endif
