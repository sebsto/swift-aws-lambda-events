// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "swift-aws-lambda-events-samples",
    platforms: [
        .macOS(.v12),
    ],
    products: [
        // demonstrate how to integrate with AWS API Gateway
        .executable(name: "APIGateway", targets: ["APIGateway"]),
    ],
    dependencies: [
        // this is the dependency on the swift-aws-lambda-runtime library
        .package(url: "https://github.com/swift-server/swift-aws-lambda-runtime.git", from: "1.0.0-alpha.2"),
        // this is the dependency on the swift-aws-lambda-events library
        // in real-world projects this would say
        // .package(url: "https://github.com/swift-server/swift-aws-lambda-runtime-events.git", from: "1.0.0")
        // but here, we're using the local version
        .package(name: "swift-aws-lambda-events", path: "../.."),
    ],
    targets: [
        .executableTarget(name: "APIGateway", dependencies: [
            .product(name: "AWSLambdaRuntime", package: "swift-aws-lambda-runtime"),
            .product(name: "AWSLambdaEvents", package: "swift-aws-lambda-events"),
        ]),
    ]
)
