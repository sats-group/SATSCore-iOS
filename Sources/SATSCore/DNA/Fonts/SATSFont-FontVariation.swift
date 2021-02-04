public extension SATSFont {
    struct FontVariation: Equatable, Hashable {
        public let name: String
        public let fontName: String
    }
}

public extension SATSFont.FontVariation {
    static let `default`   = SATSFont.FontVariation(name: "Default", fontName: "Regular")
    static let medium      = SATSFont.FontVariation(name: "Medium", fontName: "Medium")
    static let emphasis    = SATSFont.FontVariation(name: "Emphasis", fontName: "SemiBold")
    static let satsFeeling = SATSFont.FontVariation(name: "SATS feeling", fontName: "BoldItalic")
}
