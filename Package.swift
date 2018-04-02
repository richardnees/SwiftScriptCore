// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftScriptCore",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SwiftScriptCore",
            targets: ["SwiftScriptCore"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/richardnees/Bash.git", from: "0.2.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SwiftScriptCore",
            dependencies: ["Bash"],
            path: "Frameworks/SwiftScriptCore/Sources"),
        .testTarget(
            name: "SwiftScriptCoreTests",
            dependencies: ["SwiftScriptCore"],
            path: "Frameworks/SwiftScriptCore/SwiftScriptCoreTests"),
    ]
)
