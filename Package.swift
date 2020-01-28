// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "SQLCipher",
    platforms: [
        .macOS(.v10_14), .iOS(.v12)
    ],
    products: [
        .library(
            name: "SQLCipher",
            type: .static,
            targets: ["SQLCipher"])
    ],
    targets: [
        .target(
            name: "SQLCipher",
            path: "Sources",
            cSettings: [
                .define("SQLITE_HAS_CODEC", to: "1"),
                .define("SQLITE_TEMP_STORE", to: "3"),
                .define("SQLCIPHER_CRYPTO_CC", to: nil),
                .define("NDEBUG", to: "1")
            ],
            swiftSettings: [
                .define("SQLITE_HAS_CODEC"),
            ]
        )
    ]
)
