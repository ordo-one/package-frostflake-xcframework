// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "package-frostflake-xcframework",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FrostflakeKit",
            targets: ["FrostflakeKit"]),
    ],
    targets: [
        .target(
            name: "FrostflakeDummy",
            path: "Sources/Dummy"
        ),
        .binaryTarget(
            name: "FrostflakeKit",
            url: "https://github.com/ordo-one/package-frostflake/raw/xcframework/FrostflakeKit.xcframework.zip",
            checksum: "07d43efbd6abb7ecfa9311d3047532a0db4b13fa958cac466e5dfe4e076a62ca"
        )
    ]
)
