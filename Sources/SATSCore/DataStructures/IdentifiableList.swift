import Foundation

/// `IdentifiableList` is a simple approach to have a set-like
/// semantics, meaning elements are not repeated, while using
/// the `Identifiable` conformance of elements to determine
/// the presence of not of that element in the collection
public struct IdentifiableList<Element: Identifiable> {
    private var storage: [Element.ID: Element]

    // MARK: Initializers

    public init(_ elements: [Element]) {
        self.storage = elements.reduce(into: [Element.ID: Element]()) { result, element in
            result[element.id] = element
        }
    }

    // MARK: Element access

    public subscript(index: Element.ID) -> Element? {
        get { storage[index] }
        set(newValue) {
            guard let newValue = newValue else { return }
            storage[newValue.id] = newValue
        }
    }

    public var isEmpty: Bool { storage.isEmpty }

    public var content: [Element] { Array(storage.values) }

    public func contains(_ element: Element) -> Bool {
        self[element.id] != nil
    }

    // MARK: Mutating functions

    /// Updates an existing value from the collection
    public mutating func update(with newValue: Element) {
        guard contains(newValue) else { return }
        self[newValue.id] = newValue
    }

    public mutating func remove(_ element: Element) {
        storage.removeValue(forKey: element.id)
    }

    public mutating func insert(_ element: Element) {
        self[element.id] = element
    }

    // MARK: Collection access

    public func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> [Element] {
        let subArray = try storage.values.filter(isIncluded)
        return Array(subArray)
    }
}

extension IdentifiableList: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
}

extension IdentifiableList: Equatable where Element: Equatable {}
