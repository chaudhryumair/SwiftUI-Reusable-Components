// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftUIReusableComponents",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftUIReusableComponents",
            targets: ["SwiftUIReusableComponents"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftUIReusableComponents",
            path: "Sources"
        ),
    ]
)
