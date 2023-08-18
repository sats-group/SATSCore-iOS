import SwiftUI

// swiftlint:disable identifier_name
extension Binding {
    /// A way to create a new binding from another, as long as we can transform the values both ways
    /// - Parameters:
    ///   - from: function that maps the binding `Value` to a `NewType`
    ///   - to: function that maps a value of `NewType` to the original binding `Value`
    /// - Returns: a binding that is a transformed interface for an original binding
    func map<NewType>(from: @escaping (Value) -> NewType, to: @escaping (NewType) -> Value) -> Binding<NewType> {
        .init(
            get: { from(wrappedValue) },
            set: { newValue in wrappedValue = to(newValue) }
        )
    }
}
// swiftlint:enable identifier_name
