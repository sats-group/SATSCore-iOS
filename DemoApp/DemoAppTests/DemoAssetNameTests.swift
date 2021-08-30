import XCTest
@testable import DemoApp

class DemoAssetNameTests: XCTestCase {
    func testAllAssetsArePresent() {
        DemoAssetName.allCases.forEach { assetName in
            XCTAssertNotNil(
                UIImage(named: assetName.rawValue),
                "There must be an asset with name: \(assetName.rawValue)"
            )
        }
    }
}
