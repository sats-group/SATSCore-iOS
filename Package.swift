// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "SATSCore",
    platforms: [.iOS(.v15), .tvOS(.v15)],
    products: [
        .library(
            name: "SATSCore",
            targets: ["SATSCore"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/sats-group/SATSType-iOS.git", .upToNextMajor(from: "0.0.2")),
    ],
    targets: [
        .target(
            name: "SATSCore",
            dependencies: [.product(name: "SATSType", package: "SATSType-iOS")]
        ),
        .testTarget(
            name: "SATSCoreTests",
            dependencies: ["SATSCore"]
        ),
    ]
)
