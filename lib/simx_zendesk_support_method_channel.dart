import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'simx_zendesk_support_platform_interface.dart';

/// An implementation of [SimxZendeskSupportPlatform] that uses method channels.
class MethodChannelSimxZendeskSupport extends SimxZendeskSupportPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('simx_zendesk_support');

  @override
  Future<void> initialize({
    required String url,
    required String appId,
    required String clientId,
    required String? name,
    required String? emailId,
    required String? userId,
    String? jwtToken,
  }) async {
    await methodChannel.invokeMethod('initialize', {
      'zendeskUrl': url,
      'appId': appId,
      'clientId': clientId,
      "name": name,
      "emailId": emailId,
      "userId": userId,
      "jwtToken": jwtToken,
    });
  }

  @override
  Future<void> showHelpCenter({
    required String? name,
    required String? emailId,
    required String? userId,
    required List<int> categoryIdList,
  }) async {
    await methodChannel.invokeMethod('showHelpCenter', {
      "name": name,
      "emailId": emailId,
      "userId": userId,
      "categoryIdList": categoryIdList,
    });
  }

  @override
  Future<void> showHelpCenterArticleId({required String articleId}) async {
    await methodChannel.invokeMethod('showHelpCenterAriticleId', {
      "articleId": articleId,
    });
  }

  @override
  Future<void> showHelpCenterCategoryId({required String categoryId}) async {
    await methodChannel.invokeMethod('showHelpCenterCategoryId', {
      "categoryId": categoryId,
    });
  }

  @override
  Future<void> sendUserInformationForTicket({
    required String? name,
    required String? emailId,
    required String? userId,
    required String tripId,
  }) async {
    await methodChannel.invokeMethod("sendUserInformationForTicket", {
      "name": name,
      "emailId": emailId,
      "userId": userId,
      "tripId": tripId,
    });
  }

  @override
  Future<void> startChatBot() async {
    await methodChannel.invokeMethod('startChatBot');
  }

  @override
  Future<void> showListOfTickets({
    required String? name,
    required String? emailId,
    required String? userId,
    required String tripId,
  }) async {
    await methodChannel.invokeMethod('showListOfTickets', {
      "name": name,
      "emailId": emailId,
      "userId": userId,
      "tripId": tripId,
    });
  }

  @override
  Future<void> startChat({
    required String? name,
    required String? emailId,
    required String? phoneNumber,
  }) async {
    await methodChannel.invokeMethod('startChat', {
      "name": name,
      "emailId": emailId,
      "phoneNumber": phoneNumber,
    });
  }

  @override
  Future<void> setPushToken(String token) async {
    await methodChannel.invokeMethod('setPushToken', {'token': token});
  }

  @override
  Future<void> setThemeColor(int color) async {
    await methodChannel.invokeMethod('setThemeColor', {'color': color});
  }
  @override
  Future<void> uninitialize() async {
    await methodChannel.invokeMethod('uninitialize');
  }
}

