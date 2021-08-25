import SATSCore
import XCTest

class IdentifiableListTests: XCTestCase {
    let tonyStark = SampleIdentifiable(name: "Tony Stark")
    let steveRogers = SampleIdentifiable(name: "Steve Rogers")
    let bruceBanner = SampleIdentifiable(name: "Bruce Banner")

    func testUpdateValueWithTheSameIdentity() {
        // Given
        var identifiableList: IdentifiableList<SampleIdentifiable> = [
            tonyStark, steveRogers, bruceBanner,
        ]

        let intialDescriptions = identifiableList.content.sorted().map(\.description)

        // When
        identifiableList.update(with: tonyStark.loading())

        // Then
        let newDescriptions = identifiableList.content.sorted().map(\.description)

        XCTAssertEqual(
            intialDescriptions.count,
            newDescriptions.count,
            "There should be the same amount of elements, since we updated an existing one"
        )

        XCTAssertNotEqual(
            intialDescriptions,
            newDescriptions,
            "The descriptions for the content must have changed"
        )
    }

    func testAccessingElements() {
        // Given
        let identifiableList: IdentifiableList<SampleIdentifiable> = [
            tonyStark, steveRogers, bruceBanner,
        ]

        // Then
        XCTAssertEqual(
            identifiableList[tonyStark.id]?.name,
            "Tony Stark",
            "Elements can be accessed in the list by ID"
        )
    }
}

extension IdentifiableListTests {
    struct SampleIdentifiable: Identifiable, Comparable {
        let id: UUID = UUID()
        let name: String
        var isLoading: Bool = false

        var description: String {
            "\(name) // \(isLoading ? "loading" : "not loading")"
        }

        func loading() -> SampleIdentifiable {
            var copy = self
            copy.isLoading = true
            return copy
        }

        static func < (lhs: Self, rhs: Self) -> Bool {
            lhs.name < rhs.name
        }
    }
}
