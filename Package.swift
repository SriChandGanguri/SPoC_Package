// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SPoC_Package",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SPoC",
            targets: ["SPoCTarget"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/Moya/Moya", exact: "15.0.0"),
        .package(url: "https://github.com/Alamofire/Alamofire", exact: "5.6.4")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SPoCTarget",
            dependencies: [.target(name: "SPoCWrapper")]
        ),
        .target(
            name: "SPoCWrapper",
            dependencies: [
                .target(name: "SPoC"),
                .product(name: "Moya", package: "Moya"),
                .product(name: "Alamofire", package: "Alamofire")
            ]
            
        ),
        .binaryTarget(
            name: "SPoC",
            path: "./Sources/SPoC/SPoC.xcframework")
    ]
)
