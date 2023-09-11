import SATSType
public extension SATSFont {
    /// Style variations for a font regarding its weight
    struct Weight: Equatable, Hashable {
        public init(name: String, font: FontName, prefersSystemFont: Bool) {
            self.name = name
            self.font = font
            self.prefersSystemFont = prefersSystemFont
        }

        public static func == (lhs: SATSFont.Weight, rhs: SATSFont.Weight) -> Bool {
            lhs.name == rhs.name
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(name)
            hasher.combine(font.name)
        }

        public let name: String
        public let font: FontName
        /// use the system font instead of the custom one
        public let prefersSystemFont: Bool
    }
}

public extension SATSFont.Weight {
    static let `default` = SATSFont.Weight(name: "Default", font: InterFont.regular, prefersSystemFont: true)
    static let medium = SATSFont.Weight(name: "Medium", font: InterFont.medium, prefersSystemFont: true)
    static let emphasis = SATSFont.Weight(name: "Emphasis", font: InterFont.semiBold, prefersSystemFont: true)
    static let satsFeeling = SATSFont.Weight(
        name: "SATS feeling", font: SatsHeadlineFont.boldItalic, prefersSystemFont: false
    )
}
