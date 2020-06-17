// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LicenseListController",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "LicenseListController",
            targets: ["LicenseListController"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "LicenseListController",
            dependencies: []),
        .testTarget(
            name: "LicenseListControllerTests",
            dependencies: ["LicenseListController"]),
    ]
)
