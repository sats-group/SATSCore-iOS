// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SATSCore",
    platforms: [.iOS(.v12), .tvOS(.v14)],
    products: [
        .library(
            name: "SATSCore",
            targets: ["SATSCore"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SATSCore",
            dependencies: [],
            resources: [
                .process("Assets/Fonts"),
            ]
        ),
        .testTarget(
            name: "SATSCoreTests",
            dependencies: ["SATSCore"]
        ),
    ]
)
