public struct IdentifiableList<Element: Identifiable>: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = Element

    private var storage: [Element.ID: Element]

    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }

    public init(_ elements: [Element]) {
        self.storage = elements.reduce(into: [Element.ID: Element](), { result, element in
            result[element.id] = element
        })
    }

    public subscript(index: Element.ID) -> Element? {
        get { storage[index] }
        set(newValue) {
            guard let newValue = newValue else { return }
            storage[newValue.id] = newValue
        }
    }

    public var isEmpty: Bool { storage.isEmpty }

    public var content: [Element] { Array(storage.values) }

    public mutating func update(with newValue: Element) {
        self[newValue.id] = newValue
    }

    public mutating func remove(_ element: Element) {
        storage.removeValue(forKey: element.id)
    }

    public mutating func insert(_ element: Element) {
        self[element.id] = element
    }

    public func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> [Element] {
        let subArray = try storage.values.filter(isIncluded)
        return Array(subArray)
    }
}

extension IdentifiableList: Equatable where Element: Equatable {}
