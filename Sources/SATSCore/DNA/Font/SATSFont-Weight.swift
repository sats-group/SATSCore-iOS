import SATSType
public extension SATSFont {
    /// Style variations for a font regarding its weight
    struct Weight: Equatable, Hashable {
        public init(name: String, font: FontName) {
            self.name = name
            self.font = font
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
    }
}

public extension SATSFont.Weight {
    static let `default` = SATSFont.Weight(name: "Default", font: InterFont.regular)
    static let medium = SATSFont.Weight(name: "Medium", font: InterFont.medium)
    static let emphasis = SATSFont.Weight(name: "Emphasis", font: InterFont.semiBold)
    static let satsFeeling = SATSFont.Weight(name: "SATS feeling", font: SatsHeadlineFont.boldItalic)
}
