// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SATSCore",
    platforms: [.iOS(.v13), .tvOS(.v14)],
    products: [
        .library(
            name: "SATSCore",
            targets: ["SATSCore"]
        ),
    ],
    dependencies: [
        .package(
            name: "SATSType",
            url: "git@github.com:healthfitnessnordic/SATSType-iOS.git",
            .upToNextMajor(from: "0.0.1")
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
