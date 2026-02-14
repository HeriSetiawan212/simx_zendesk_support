import 'simx_zendesk_support_platform_interface.dart';

class SimxZendeskSupport {
  Future<void> initialize({
    required String url,
    required String appId,
    required String clientId,
    required String name,
    required String emailId,
    required String userId,
  }) {
    return SimxZendeskSupportPlatform.instance.initialize(
      url: url,
      appId: appId,
      clientId: clientId,
      name: name,
      emailId: emailId,
      userId: userId,
    );
  }

  Future<void> showHelpCenter({
    required String name,
    required String emailId,
    required String userId,
    required List<int> categoryIdList,
  }) {
    return SimxZendeskSupportPlatform.instance.showHelpCenter(
      name: name,
      emailId: emailId,
      userId: userId,
      categoryIdList: categoryIdList,
    );
  }

  Future<void> startChatBot() {
    return SimxZendeskSupportPlatform.instance.startChatBot();
  }

  Future<void> showHelpWithArticleId({required String articleId}) {
    return SimxZendeskSupportPlatform.instance.showHelpCenterArticleId(
      articleId: articleId,
    );
  }

  Future<void> showHelpWithCategoryId({required String categoryId}) {
    return SimxZendeskSupportPlatform.instance.showHelpCenterCategoryId(
      categoryId: categoryId,
    );
  }

  Future<void> sendUserInformationForTicket({
    required String name,
    required String emailId,
    required String userId,
    required String tripId,
  }) {
    return SimxZendeskSupportPlatform.instance.sendUserInformationForTicket(
      name: name,
      emailId: emailId,
      userId: userId,
      tripId: tripId,
    );
  }

  Future<void> showListOfTickets({
    required String name,
    required String emailId,
    required String userId,
    required String tripId,
  }) {
    return SimxZendeskSupportPlatform.instance.showListOfTickets(
      name: name,
      emailId: emailId,
      userId: userId,
      tripId: tripId,
    );
  }

  Future<void> startChat({
    required String name,
    required String emailId,
    required String phoneNumber,
  }) {
    return SimxZendeskSupportPlatform.instance.startChat(
      name: name,
      emailId: emailId,
      phoneNumber: phoneNumber,
    );
  }
}
