import Foundation

enum InterFont: String, CaseIterable {
    case bold = "Inter-Bold"
    case boldItalic = "Inter-BoldItalic"
    case regular = "Inter-Regular"
    case regularItalic = "Inter-Italic"
    case semiBold = "Inter-SemiBold"
    case semiBoldItalic = "Inter-SemiBoldItalic"
    case medium = "Inter-Medium"
    case mediumItalic = "Inter-MediumItalic"

    var name: String { rawValue }
}
