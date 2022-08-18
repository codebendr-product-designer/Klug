// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HWS",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "HWS",
            targets: ["HWS"]),
        .library(
            name: "WeSplit",
            targets: ["WeSplit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/codebendr-product-designer/Klug", branch: "develop")
    ],
    targets: [
        .target(name: "HWS"),
        .target(name: "WeSplit", dependencies: ["Klug"])
    ]
)
