import 'package:flutter/services.dart';
import 'simx_zendesk_support_platform_interface.dart';

/// Android ActivityInfo.screenOrientation values for configuring Zendesk screen orientation.
/// Pass one of these as [SimxZendeskSupport.initialize]'s [androidScreenOrientation] parameter.
/// Has no effect on iOS.
class ZendeskAndroidScreenOrientation {
  ZendeskAndroidScreenOrientation._();

  static const int landscape = 0;
  static const int portrait = 1;
  static const int sensorLandscape = 6;
  static const int sensorPortrait = 7;
  static const int reverseLandscape = 8;
  static const int reversePortrait = 9;
  static const int fullSensor = 10; // all orientations, sensor-driven
  static const int userLandscape = 11;
  static const int userPortrait = 12;
  static const int fullUser = 13;
  static const int locked = 14;
}

/// iOS UIInterfaceOrientationMask raw values for configuring Zendesk screen orientation.
/// Pass one of these (or a bitwise OR of multiple) as [SimxZendeskSupport.initialize]'s
/// [iosOrientationMask] parameter. Has no effect on Android.
class ZendeskIosOrientationMask {
  ZendeskIosOrientationMask._();

  static const int portrait = 2;
  static const int landscapeLeft = 4;
  static const int landscapeRight = 8;
  static const int portraitUpsideDown = 16;
  static const int landscape = 24; // landscapeLeft | landscapeRight
  static const int all = 30;
  static const int allButUpsideDown = 26; // portrait | landscape
}

class SimxZendeskSupport {
  Future<void> initialize({
    required String url,
    required String appId,
    required String clientId,
    required String? name,
    required String? emailId,
    required String? userId,
    String? jwtToken,
    /// iOS only. Controls which orientations the Zendesk screens support.
    /// Use [ZendeskIosOrientationMask] constants. Defaults to portrait-only (2).
    int? iosOrientationMask,
    /// Android only. Controls the screen orientation of Zendesk activities.
    /// Use [ZendeskAndroidScreenOrientation] constants. Defaults to portrait (1).
    int? androidScreenOrientation,
  }) async {
    try {
      await SimxZendeskSupportPlatform.instance.initialize(
        url: url,
        appId: appId,
        clientId: clientId,
        name: name,
        emailId: emailId,
        userId: userId,
        jwtToken: jwtToken,
        iosOrientationMask: iosOrientationMask,
        androidScreenOrientation: androidScreenOrientation,
      );
    } on PlatformException catch (e) {
      throw Exception('Failed to initialize Zendesk: ${e.message}');
    } catch (e) {
      throw Exception('Failed to initialize Zendesk: $e');
    }
  }

  Future<void> showHelpCenter({
    required String? name,
    required String? emailId,
    required String? userId,
    required List<int> categoryIdList,
  }) async {
    try {
      await SimxZendeskSupportPlatform.instance.showHelpCenter(
        name: name,
        emailId: emailId,
        userId: userId,
        categoryIdList: categoryIdList,
      );
    } on PlatformException catch (e) {
      throw Exception('Failed to show Help Center: ${e.message}');
    } catch (e) {
      throw Exception('Failed to show Help Center: $e');
    }
  }

  Future<void> startChatBot() async {
    try {
      await SimxZendeskSupportPlatform.instance.startChatBot();
    } on PlatformException catch (e) {
      throw Exception('Failed to start Chat Bot: ${e.message}');
    } catch (e) {
      throw Exception('Failed to start Chat Bot: $e');
    }
  }

  Future<void> showHelpWithArticleId({required String articleId}) async {
    try {
      await SimxZendeskSupportPlatform.instance.showHelpCenterArticleId(
        articleId: articleId,
      );
    } on PlatformException catch (e) {
      throw Exception('Failed to show article: ${e.message}');
    } catch (e) {
      throw Exception('Failed to show article: $e');
    }
  }

  Future<void> showHelpWithCategoryId({required String categoryId}) async {
    try {
      await SimxZendeskSupportPlatform.instance.showHelpCenterCategoryId(
        categoryId: categoryId,
      );
    } on PlatformException catch (e) {
      throw Exception('Failed to show category: ${e.message}');
    } catch (e) {
      throw Exception('Failed to show category: $e');
    }
  }

  Future<void> sendUserInformationForTicket({
    required String? name,
    required String? emailId,
    required String? userId,
    required String tripId,
  }) async {
    try {
      await SimxZendeskSupportPlatform.instance.sendUserInformationForTicket(
        name: name,
        emailId: emailId,
        userId: userId,
        tripId: tripId,
      );
    } on PlatformException catch (e) {
      throw Exception('Failed to send user information: ${e.message}');
    } catch (e) {
      throw Exception('Failed to send user information: $e');
    }
  }

  Future<void> showListOfTickets({
    required String? name,
    required String? emailId,
    required String? userId,
    required String tripId,
  }) async {
    try {
      await SimxZendeskSupportPlatform.instance.showListOfTickets(
        name: name,
        emailId: emailId,
        userId: userId,
        tripId: tripId,
      );
    } on PlatformException catch (e) {
      throw Exception('Failed to show tickets: ${e.message}');
    } catch (e) {
      throw Exception('Failed to show tickets: $e');
    }
  }

  Future<void> startChat({
    required String? name,
    required String? emailId,
    required String? phoneNumber,
  }) async {
    try {
      await SimxZendeskSupportPlatform.instance.startChat(
        name: name,
        emailId: emailId,
        phoneNumber: phoneNumber,
      );
    } on PlatformException catch (e) {
      throw Exception('Failed to start chat: ${e.message}');
    } catch (e) {
      throw Exception('Failed to start chat: $e');
    }
  }

  /// Sets the push token for Zendesk notifications
  Future<void> setPushToken(String token) async {
    try {
      await SimxZendeskSupportPlatform.instance.setPushToken(token);
    } on PlatformException catch (e) {
      throw Exception('Failed to set push token: ${e.message}');
    } catch (e) {
      throw Exception('Failed to set push token: $e');
    }
  }

  /// Sets the primary theme color for Zendesk SDK UI
  Future<void> setThemeColor(int color) async {
    try {
      await SimxZendeskSupportPlatform.instance.setThemeColor(color);
    } on PlatformException catch (e) {
      throw Exception('Failed to set theme color: ${e.message}');
    } catch (e) {
      throw Exception('Failed to set theme color: $e');
    }
  }
  /// Uninitialize the Zendesk SDK and clear user information
  Future<void> uninitialize() async {
    try {
      await SimxZendeskSupportPlatform.instance.uninitialize();
    } on PlatformException catch (e) {
      throw Exception('Failed to uninitialize Zendesk: ${e.message}');
    } catch (e) {
      throw Exception('Failed to uninitialize Zendesk: $e');
    }
  }
}

