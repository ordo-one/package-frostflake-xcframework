// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "package-frostflake-xcframework",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FrostflakeDllKit",
            targets: ["FrostflakeDllKit"]),
    ],
    targets: [
        .target(
            name: "FrostflakeDummy",
            path: "Sources/Dummy"
        ),
        .binaryTarget(
            name: "FrostflakeDllKit",
            url: "https://github.com/ordo-one/package-frostflake/raw/xcframework/FrostflakeDllKit.xcframework.zip",
            checksum: "cef002e947c506d100696db6f107d324c1067111e25bd6cfa0a9713d51705e1f"
        )
    ]
)
