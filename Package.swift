// swift-tools-version:5.6
import PackageDescription

let package = Package(
  name: "reading-stats-api",
  platforms: [.macOS(.v12)],
  dependencies: [
    .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
    .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
    .package(
      url: "https://github.com/vapor/fluent-postgres-driver.git",
      from: "2.2.6"
    ),
  ],
  targets: [
    .target(
      name: "App",
      dependencies: [
        .product(name: "Fluent", package: "fluent"),
        .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver"),
        .product(name: "Vapor", package: "vapor"),
      ],
      swiftSettings: [.unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))]
    ),
    .executableTarget(name: "Run", dependencies: [.target(name: "App")]),
    .testTarget(name: "AppTests", dependencies: [
      .target(name: "App"),
      .product(
        name: "XCTVapor",
        package: "vapor"
      ),
    ]),
  ]
)
