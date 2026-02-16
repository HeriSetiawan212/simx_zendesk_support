## 0.0.5 (2026-02-17)

* **Features**:
    * Added **Swift Package Manager (SPM)** support for iOS.
* **Refactor (iOS)**:
    * Restructured `ios` directory to comply with Flutter SPM guidelines.
    * Migrated source files and resources to `ios/simx_zendesk_support/Sources/simx_zendesk_support/`.
    * Maintained CocoaPods compatibility via updated `.podspec`.
* **Documentation**:
    * Updated `README.md` with SPM integration guide.
    * Added troubleshooting guide for common Android theme issues.

## 0.0.4 (2026-02-16)

* **Improvements**:
    * Minor tweaks and maintenance.

## 0.0.3 (2026-02-15)

* **Fixes (Android)**:
    * Downgraded Java version to 11 (VERSION_11) for better compatibility with legacy environments.
    * Updated Kotlin version to 2.2.21 to resolve compilation issues.
    * Fixed inconsistent JVM target compatibility between Java and Kotlin tasks.
    * Fixed various build-time warnings in the Android module.

## 0.0.2 (2026-02-15)

* **Features**:
    * Added push notification support via `setPushToken()`.
    * Added programmatic theme color customization via `setThemeColor()`.
* **Fixes (Android)**:
    * Fixed crash due to missing `Theme.AppCompat` requirements for Zendesk activities.
    * Fixed `AppBarLayout` inflation error by aligning `com.google.android.material:material` version (1.9.0).
    * Updated Zendesk SDK dependencies to current stable versions (Messaging 5.6.0, Support 5.4.0, Chat 3.6.0).
    * Fixed `MessagingActivity` import for SDK versions >= 5.3.0.
* **Improvements**:
    * Enhanced example app with real-time initialization status and error reporting.
    * Added comprehensive documentation including `TROUBLESHOOTING.md` and `IMPLEMENTATION_SUMMARY.md`.
    * Updated `README.md` with detailed configuration steps and support links.

## 0.0.1 (2024-02-15)

* Initial release.
* Added support for Android and iOS.
* Integrated Zendesk Chat SDK, Support SDK, and AnswerBot SDK.
