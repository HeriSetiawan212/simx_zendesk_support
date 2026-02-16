# Troubleshooting Android Debug Connection

## Issue: "Error waiting for a debug connection: The log reader stopped unexpectedly"

This error occurs when running the app in debug mode on some Android devices, particularly with the Zendesk SDK which has a large number of methods.

### Solutions Applied:

1. **Added MultiDex Support** (`example/android/app/build.gradle.kts`):
   ```kotlin
   defaultConfig {
       multiDexEnabled = true
   }
   ```

2. **Added Network Permissions** (`example/android/app/src/main/AndroidManifest.xml`):
   ```xml
   <uses-permission android:name="android.permission.INTERNET"/>
   <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
   <application android:usesCleartextTraffic="true">
   ```

3. **Added Zendesk Maven Repositories** (`example/android/build.gradle.kts`):
   ```kotlin
   allprojects {
       repositories {
           maven { url = uri("https://zendesk.jfrog.io/zendesk/repo") }
           maven { url = uri("https://zendesk.jfrog.io/artifactory/repo") }
       }
   }
   ```

### Workarounds:

If the debug connection still fails:

1. **Run in Release Mode**:
   ```bash
   flutter run --release
   ```

2. **Run in Profile Mode**:
   ```bash
   flutter run --profile
   ```

3. **Install and Launch Manually**:
   ```bash
   flutter build apk
   flutter install
   # Then launch the app manually from the device
   ```

4. **Use Hot Restart Instead of Hot Reload**:
   - Press `R` in the terminal instead of `r`

5. **Check Device Logs**:
   ```bash
   adb logcat | grep -i flutter
   ```

### Device-Specific Issues:

Some devices (particularly Vivo, Oppo, Xiaomi) have aggressive battery optimization that can interfere with debug connections. To fix:

1. Go to Settings > Battery > App Battery Saver
2. Find your app and set it to "No restrictions"
3. Enable "Developer options" > "Stay awake" and "USB debugging (Security settings)"

The app itself should work fine; this is only a debug connection issue.

---

## Issue: Android Theming/Style Crash (AppBarLayout)

When launching Zendesk activities on Android, you might encounter a crash related to `AppBarLayout` or missing theme attributes.

### Error:
`java.lang.IllegalArgumentException: The style on this component requires your app theme to be under Theme.MaterialComponents (or a descendant).`

### Solution:

1. **Update your App Theme**:
   Ensure your main application theme in `android/app/src/main/res/values/styles.xml` (or `themes.xml`) inherits from a Material Components theme.

   ```xml
   <style name="LaunchTheme" parent="Theme.MaterialComponents.DayNight.NoActionBar">
       <item name="android:windowBackground">@drawable/launch_background</item>
   </style>

   <style name="NormalTheme" parent="Theme.MaterialComponents.DayNight.NoActionBar">
       <item name="android:windowBackground">?android:colorBackground</item>
   </style>
   ```

2. **Define Required Attributes**:
   If you cannot change the parent theme, ensure the following attributes are defined in your theme:
   - `colorPrimary`
   - `colorPrimaryDark`
   - `colorAccent`

3. **Check Dependencies**:
   Ensure you have the Material Components library in your `android/app/build.gradle`:
   ```gradle
   implementation 'com.google.android.material:material:1.9.0'
   ```

## Issue: Swift Package Manager (SPM) Conflicts on iOS

If you encounter issues after migrating to SPM:

1. **Clear Build Folders**:
   ```bash
   flutter clean
   rm -rf ios/Pods ios/Podfile.lock
   ```

2. **Enable SPM in Flutter**:
   ```bash
   flutter config --enable-swift-package-manager
   ```

3. **Re-install dependencies**:
   ```bash
   flutter pub get
   ```

