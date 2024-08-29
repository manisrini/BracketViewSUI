// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let designSystem = "DesignSystem"

let package = Package(
    name: "TournamentBracket",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TournamentBracket",
            targets: ["TournamentBracket"])
    ],
    dependencies: [
        .package(name: designSystem, path: "../Brackets/\(designSystem)")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "TournamentBracket",
            dependencies: [.product(name: designSystem, package: designSystem)],
            resources: [.process("Resources")]),
        .testTarget(
            name: "TournamentBracketTests",
            dependencies: ["TournamentBracket"]),
    ]
)
