// swift-tools-version:5.5
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
        .package(
            name: "SATSType",
            url: "https://github.com/healthfitnessnordic/SATSType-iOS.git",
            .upToNextMajor(from: "0.0.2")
        ),
    ],
    targets: [
        .target(
            name: "SATSCore",
            dependencies: ["SATSType"]
        ),
        .testTarget(
            name: "SATSCoreTests",
            dependencies: ["SATSCore"]
        ),
    ]
)
