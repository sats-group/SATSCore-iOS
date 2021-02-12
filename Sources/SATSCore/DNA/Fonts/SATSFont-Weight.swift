public extension SATSFont {
    /// Style variations for a font regarding its weight
    struct Weight: Equatable, Hashable {
        public let name: String
        public let fontName: String
    }
}

public extension SATSFont.Weight {
    static let `default`   = SATSFont.Weight(name: "Default", fontName: "Regular")
    static let medium      = SATSFont.Weight(name: "Medium", fontName: "Medium")
    static let emphasis    = SATSFont.Weight(name: "Emphasis", fontName: "SemiBold")
    static let satsFeeling = SATSFont.Weight(name: "SATS feeling", fontName: "BoldItalic")
}
