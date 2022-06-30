// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "ColorPickers",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "ColorPickers",
            targets: [
                "ColorPickers"
            ]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/auremsinistram/Square.git",
            from: .init(0, 2, 0)
        ),
        .package(
            url: "https://github.com/auremsinistram/Colors.git",
            from: .init(0, 2, 1)
        )
    ],
    targets: [
        .target(
            name: "ColorPickers",
            dependencies: [
                .product(
                    name: "Square"
                ),
                .product(
                    name: "Colors"
                )
            ]
        )
    ]
)
