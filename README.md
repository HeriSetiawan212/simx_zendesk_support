# simx_zendesk_support

A Flutter plugin for integrating Zendesk Support, Chat, and AnswerBot SDKs on both Android and iOS. This plugin simplifies the process of embedding Zendesk's customer support features into your Flutter application.

## Features

- **Initialize Zendesk SDK**: Configure with your Zendesk URL, App ID, and Client ID.
- **Start Chat**: Launch a live chat session with support agents.
- **Start Chat Bot (Answer Bot)**: Initiate an automated conversation with Answer Bot.
- **Show Help Center**: Display your Zendesk Help Center articles and categories.
- **Send User Information**: Pass user details (name, email, phone) to Zendesk for context.
- **Show List of Tickets**: View a list of the user's support tickets.

## Getting Started

### Installation

Add `simx_zendesk_support` to your `pubspec.yaml`:

```yaml
dependencies:
  simx_zendesk_support: ^0.0.1
```

### Platform Configuration

#### Android

1.  Set the `minSdkVersion` to `24` in your `android/app/build.gradle`:

    ```gradle
    defaultConfig {
        minSdkVersion 24
    }
    ```

2.  Add the `INTERNET` permission to your `AndroidManifest.xml` if not already present:

    ```xml
    <uses-permission android:name="android.permission.INTERNET"/>
    ```
    
#### iOS

1.  Ensure your deployment target is set to **iOS 13.0** or higher in your `Podfile`:

    ```ruby
    platform :ios, '13.0'
    ```

2.  Add usage descriptions to your `Info.plist` for camera, photo library, and microphone access (required for attachments and voice messages):

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

Initialize the plugin:

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

### Start Chat

```dart
_zendeskSupport.startChat(
  name: 'User Name',
  emailId: 'user@example.com',
  phoneNumber: '1234567890',
);
```

### Show Help Center

```dart
_zendeskSupport.showHelpCenter(
  name: 'User Name',
  emailId: 'user@example.com',
  userId: 'unique_user_id',
  categoryIdList: [], // Optional list of category IDs to filter
);
```

### Push Notifications

To register your push token with Zendesk (FCM for Android, APNs for iOS):

```dart
await _zendeskSupport.setPushToken("YOUR_DEVICE_TOKEN");
```

### Custom Theming

You can set a primary theme color for the Zendesk SDK UI:

```dart
await _zendeskSupport.setThemeColor(0xFF0000FF); // Blue
```

*Note: On Android, programmatic theming for the Unified SDK is limited. It is recommended to use the `styles.xml` approach for comprehensive results.*

## Support

If you find this plugin helpful and want to support its development, you can buy me a coffee!

<a href="https://saweria.co/setiawanheribambang" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

## Contributing

Contributions are welcome! If you find a bug or want to add a feature, please open an issue or submit a pull request on [GitHub](https://github.com/HeriSetiawan212/simx_zendesk_support).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
