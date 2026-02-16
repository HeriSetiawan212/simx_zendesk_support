import 'package:flutter/services.dart';
import 'simx_zendesk_support_platform_interface.dart';

class SimxZendeskSupport {
  Future<void> initialize({
    required String url,
    required String appId,
    required String clientId,
    required String? name,
    required String? emailId,
    required String? userId,
    String? jwtToken,
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
}
