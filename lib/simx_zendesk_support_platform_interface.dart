import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'simx_zendesk_support_method_channel.dart';

abstract class SimxZendeskSupportPlatform extends PlatformInterface {
  /// Constructs a SimxZendeskSupportPlatform.
  SimxZendeskSupportPlatform() : super(token: _token);

  static final Object _token = Object();

  static SimxZendeskSupportPlatform _instance =
      MethodChannelSimxZendeskSupport();

  /// The default instance of [SimxZendeskSupportPlatform] to use.
  ///
  /// Defaults to [MethodChannelSimxZendeskSupport].
  static SimxZendeskSupportPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SimxZendeskSupportPlatform] when
  /// they register themselves.
  static set instance(SimxZendeskSupportPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initialize({
    required String url,
    required String appId,
    required String clientId,
    required String? name,
    required String? emailId,
    required String? userId,
    String? jwtToken,
  }) {
    throw UnimplementedError('initialize() has not been implemented.');
  }

  Future<void> showHelpCenter({
    required String? name,
    required String? emailId,
    required String? userId,
    required List<int> categoryIdList,
  }) {
    throw UnimplementedError('showHelpCenter() has not been implemented.');
  }

  Future<void> showHelpCenterArticleId({required String articleId}) {
    throw UnimplementedError(
      'showHelpCenterWithArticleId() has not been implemented.',
    );
  }

  Future<void> showHelpCenterCategoryId({required String categoryId}) {
    throw UnimplementedError(
      'showHelpCenterWithCategoryId() has not been implemented.',
    );
  }

  Future<void> sendUserInformationForTicket({
    required String? name,
    required String? emailId,
    required String? userId,
    required String tripId,
  }) {
    throw UnimplementedError(
      'sendUserInformationForTicket() has not been implemented',
    );
  }

  Future<void> startChatBot() {
    throw UnimplementedError('startBot() has not been implemented.');
  }

  Future<void> showListOfTickets({
    required String? name,
    required String? emailId,
    required String? userId,
    required String tripId,
  }) {
    throw UnimplementedError('showListOfTickets() has not been implemented.');
  }

  Future<void> startChat({
    required String? name,
    required String? emailId,
    required String? phoneNumber,
  }) {
    throw UnimplementedError("startChat() has not been implemented.");
  }

  /// Set the push token for Zendesk notifications
  Future<void> setPushToken(String token) {
    throw UnimplementedError('setPushToken() has not been implemented.');
  }

  /// Set the primary theme color for Zendesk SDK
  Future<void> setThemeColor(int color) {
    throw UnimplementedError('setThemeColor() has not been implemented.');
  }
}
