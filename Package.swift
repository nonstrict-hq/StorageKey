// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "StorageKey",
    platforms: [
        .macOS(.v11),
        .iOS(.v14),
        .tvOS(.v14),
        .watchOS(.v7)
    ],
    products: [
        .library(name: "StorageKey", targets: ["StorageKey"]),
    ],
    targets: [
        .target(name: "StorageKey", dependencies: []),
    ]
)
