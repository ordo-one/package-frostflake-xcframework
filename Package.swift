// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let xcframeworks: [String: String] = [
    "macos-arm64": "a12edc35269ad9a2c4a136ed9c8caf296a628878934fb745ef4467e4ff83c3f5",
    "macos-x86_64": "61916fc4e86d7bb19562fbeb69bc341a9594e3af3613e3d216d3e4e15658dccb",
    "linux-aarch64": "b0f41ea7d12e877bec6aab596178f973988e7c335aaeca129f6b6080d9b517da",
    "linux-x86_64": "bcde8f81babd503688d391d336c1b7727fc008c87055260f741e761ca74ec8ac"
]

let platform: String = {
#if os(macOS) && arch(arm64)
    return "macos-arm64"
#elseif os(macOS) && arch(x86_64)
    return "macos-x86_64"
#elseif os(Linux) && arch(arm64)
    return "linux-aarch64"
#elseif os(Linux) && arch(x86_64)
    return "linux-x86_64"
#else
    preconditionFailure("Unsupported architecture")
#endif
}()

let checksum: String = {
    guard let checksum = xcframeworks[platform] else {
        preconditionFailure("No checksum for platform \(platform)")
    }
    return checksum
}()

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
            url: "https://github.com/ordo-one/package-frostflake/raw/xcframework/xcframeworks/\(platform)/FrostflakeKit.xcframework.zip",
            checksum: checksum
        )
    ]
)
