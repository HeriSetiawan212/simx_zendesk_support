// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "simx_zendesk_support",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "simx_zendesk_support",
            targets: ["simx_zendesk_support"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/zendesk/core_sdk_ios", from: "2.5.0"),
        .package(url: "https://github.com/zendesk/support_sdk_ios", from: "5.5.0"),
        .package(url: "https://github.com/zendesk/chat_sdk_ios", from: "2.12.0"),
        .package(url: "https://github.com/zendesk/answer_bot_sdk_ios", from: "2.1.0"),
        .package(url: "https://github.com/zendesk/commonui_sdk_ios", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "simx_zendesk_support",
            dependencies: [
                .product(name: "ZendeskCoreSDK", package: "core_sdk_ios"),
                .product(name: "ZendeskSupportSDK", package: "support_sdk_ios"),
                .product(name: "ZendeskChatSDK", package: "chat_sdk_ios"),
                .product(name: "ZendeskAnswerBotSDK", package: "answer_bot_sdk_ios"),
                .product(name: "ZendeskCommonUISDK", package: "commonui_sdk_ios"),
            ],
            path: "Sources/simx_zendesk_support",
            resources: [
                .process("Resources/PrivacyInfo.xcprivacy")
            ]
        ),
    ]
)
