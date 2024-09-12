// swift-tools-version: 5.10

import PackageDescription
import Foundation

// "https://github.com/sjavora/swift-syntax-xcframeworks/releases/download/510.0.1/SwiftSyntaxWrapper.xcframework.zip"
let url = "https://github.com/yume190/MirrorPrebuilt/releases/download"
//         https://github.com/yume190/MirrorPrebuilt/releases/download/1.0.0/MirrorOrigin.xcframework.zip
let tag = "1.0.0"

func prebuiltTarget(name: String, checksum: String, dependencies: [Target.Dependency] = []) -> [Target] {
    return [
        .binaryTarget(
            name: name,
            url: "\(url)/\(tag)/\(name).xcframework.zip",
            checksum: checksum
        ),
        .target(
            name: "\(name)_Aggregation",
            dependencies: [
                .target(name: name),
            ] + dependencies
        ),
    ]
}

let targets: [[Target]] = [
    prebuiltTarget(
        name: "MirrorOrigin",
        checksum: "c035d851bd804f71079fb1388e5c0fa20d98a79e680d16bc66b2babe1fad70ac"
    ),
]

let package = Package(
    name: "MirrorOrigin",
    // platforms: [],
    products: [
        .library(
            name: "MirrorOrigin",
            targets: [
                "MirrorOrigin_Aggregation",
            ]),
    ],
    dependencies: [

    ],
    targets: targets.flatMap { $0 }
)