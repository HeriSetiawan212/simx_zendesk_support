# simx_zendesk_support

A Flutter plugin for integrating Zendesk Support, Chat, and AnswerBot SDKs on both Android and iOS. This plugin simplifies the process of embedding Zendesk's customer support features into your Flutter application.

## Features

- **Initialize Zendesk SDK**: Configure with your Zendesk URL, App ID, and Client ID.
- **JWT Authentication**: Support authenticated user identity via JWT token.
- **Start Chat**: Launch a live chat session with support agents.
- **Start Chat Bot (Answer Bot)**: Initiate an automated conversation with Answer Bot.
- **Show Help Center**: Display your Zendesk Help Center articles and categories.
- **Send User Information**: Pass user details (name, email, trip ID) to Zendesk for context.
- **Show List of Tickets**: View a list of the user's support tickets.
- **Push Notifications**: Register device tokens for Zendesk push notifications.
- **Custom Theme Color**: Set the primary color for Zendesk UI (iOS).
- **Configurable Screen Orientation**: Control whether Zendesk screens can auto-rotate on both Android and iOS.
- **Uninitialize**: Clear user session and reset Zendesk identity.

## Getting Started

### Installation

Add `simx_zendesk_support` to your `pubspec.yaml`:

```yaml
dependencies:
  simx_zendesk_support: ^0.0.11
```

### Platform Configuration

#### Android

1. Set the `minSdkVersion` to `24` in your `android/app/build.gradle`:

    ```gradle
    defaultConfig {
        minSdkVersion 24
    }
    ```

2. Add the `INTERNET` permission to your `AndroidManifest.xml` if not already present:

    ```xml
    <uses-permission android:name="android.permission.INTERNET"/>
    ```

3. Ensure your app theme inherits from `Theme.MaterialComponents` in `styles.xml` to avoid crashes when opening Zendesk UI:

    ```xml
    <style name="AppTheme" parent="Theme.MaterialComponents.Light.NoActionBar">
        ...
    </style>
    ```

#### iOS

1. Ensure your deployment target is set to **iOS 13.0** or higher in your `Podfile`:

    ```ruby
    platform :ios, '13.0'
    ```

2. **Swift Package Manager Support**: This plugin supports Swift Package Manager (SPM) for iOS. If your app is configured to use SPM, Flutter will automatically resolve the dependencies. Ensure you've enabled SPM in your Flutter configuration:
    ```bash
    flutter config --enable-swift-package-manager
    ```

3. Add usage descriptions to your `Info.plist` for camera, photo library, and microphone access (required for attachments and voice messages):

    ```xml
    <key>NSCameraUsageDescription</key>
    <string>This app requires access to the camera to attach photos to support tickets.</string>
    <key>NSPhotoLibraryUsageDescription</key>
    <string>This app requires access to the photo library to attach photos to support tickets.</string>
    <key>NSMicrophoneUsageDescription</key>
    <string>This app requires access to the microphone for voice messages.</string>
    ```

## Usage

Import the package:

```dart
import 'package:simx_zendesk_support/simx_zendesk_support.dart';
```

### Initialize

```dart
final _zendeskSupport = SimxZendeskSupport();

await _zendeskSupport.initialize(
  url: 'https://yoursubdomain.zendesk.com',
  appId: 'YOUR_APP_ID',
  clientId: 'YOUR_CLIENT_ID',
  name: 'User Name',
  emailId: 'user@example.com',
  userId: 'unique_user_id',
);
```

#### JWT Authentication

Pass a JWT token to use an authenticated identity instead of anonymous:

```dart
await _zendeskSupport.initialize(
  url: 'https://yoursubdomain.zendesk.com',
  appId: 'YOUR_APP_ID',
  clientId: 'YOUR_CLIENT_ID',
  name: 'User Name',
  emailId: 'user@example.com',
  userId: 'unique_user_id',
  jwtToken: 'YOUR_JWT_TOKEN',
);
```

### Start Chat

```dart
await _zendeskSupport.startChat(
  name: 'User Name',
  emailId: 'user@example.com',
  phoneNumber: '1234567890',
);
```

### Start Chat Bot (Answer Bot)

```dart
await _zendeskSupport.startChatBot();
```

### Show Help Center

```dart
await _zendeskSupport.showHelpCenter(
  name: 'User Name',
  emailId: 'user@example.com',
  userId: 'unique_user_id',
  categoryIdList: [123456, 789012], // Leave empty to show all categories
);
```

### Send User Information for a Ticket

```dart
await _zendeskSupport.sendUserInformationForTicket(
  name: 'User Name',
  emailId: 'user@example.com',
  userId: 'unique_user_id',
  tripId: 'TRIP_ID',
);
```

### Show List of Tickets

```dart
await _zendeskSupport.showListOfTickets(
  name: 'User Name',
  emailId: 'user@example.com',
  userId: 'unique_user_id',
  tripId: 'TRIP_ID',
);
```

### Push Notifications

Register your device push token with Zendesk (FCM for Android, APNs for iOS):

```dart
await _zendeskSupport.setPushToken('YOUR_DEVICE_TOKEN');
```

### Custom Theming

Set a primary theme color for the Zendesk SDK UI:

```dart
await _zendeskSupport.setThemeColor(0xFF0000FF); // Blue
```

> **Note:** On Android, programmatic theming is limited in the Unified SDK. Use `styles.xml` for comprehensive theming.

### Uninitialize

Clear the user session and reset the Zendesk identity (e.g., on logout):

```dart
await _zendeskSupport.uninitialize();
```

---

## Screen Orientation

By default, all Zendesk screens are locked to **portrait** on both platforms. You can change this behavior via `initialize`:

```dart
await _zendeskSupport.initialize(
  // ... required params ...
  iosOrientationMask: ZendeskIosOrientationMask.allButUpsideDown,
  androidScreenOrientation: ZendeskAndroidScreenOrientation.fullSensor,
);
```

### iOS — `ZendeskIosOrientationMask`

Corresponds to `UIInterfaceOrientationMask` raw values.

| Constant | Value | Description |
|---|---|---|
| `portrait` | 2 | Portrait only *(default)* |
| `landscapeLeft` | 4 | Landscape left only |
| `landscapeRight` | 8 | Landscape right only |
| `portraitUpsideDown` | 16 | Portrait upside-down |
| `landscape` | 24 | Both landscape orientations |
| `allButUpsideDown` | 26 | Portrait + landscape |
| `all` | 30 | All orientations |

### Android — `ZendeskAndroidScreenOrientation`

Corresponds to `ActivityInfo.screenOrientation` values.

| Constant | Value | Description |
|---|---|---|
| `portrait` | 1 | Portrait only *(default)* |
| `landscape` | 0 | Landscape only |
| `sensorPortrait` | 7 | Portrait (normal + reverse) |
| `sensorLandscape` | 6 | Landscape (left + right) |
| `reverseLandscape` | 8 | Reverse landscape |
| `reversePortrait` | 9 | Reverse portrait |
| `fullSensor` | 10 | All orientations, sensor-driven |
| `userLandscape` | 11 | User-preferred landscape |
| `userPortrait` | 12 | User-preferred portrait |
| `fullUser` | 13 | All orientations, user-preferred |
| `locked` | 14 | Locked to current orientation |

---

## Support

If you find this plugin helpful and want to support its development, you can buy me a coffee!

<a href="https://saweria.co/setiawanheribambang" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

## Contributing

Contributions are welcome! If you find a bug or want to add a feature, please open an issue or submit a pull request on [GitHub](https://github.com/HeriSetiawan212/simx_zendesk_support).

## Troubleshooting

For common issues like Android theme crashes (`AppBarLayout`) or iOS build errors, please refer to the [TROUBLESHOOTING.md](TROUBLESHOOTING.md) guide.

### Quick Tip: Android Theme Crash

If your app crashes when opening Zendesk UI, ensure your app theme inherits from `Theme.MaterialComponents` in `styles.xml`.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
