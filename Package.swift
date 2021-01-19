// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SatsCore",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "SatsCore",
            targets: ["SatsCore"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SatsCore",
            dependencies: []
        ),
        .testTarget(
            name: "SatsCoreTests",
            dependencies: ["SatsCore"]
        ),
    ]
)
