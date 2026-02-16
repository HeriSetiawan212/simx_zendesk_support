import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simx_zendesk_support/simx_zendesk_support_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MethodChannelSimxZendeskSupport platform;
  final List<MethodCall> log = <MethodCall>[];

  setUp(() {
    platform = MethodChannelSimxZendeskSupport();

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(platform.methodChannel, (
          MethodCall methodCall,
        ) async {
          log.add(methodCall);
          return null;
        });
  });

  tearDown(() {
    log.clear();
  });

  group('MethodChannelSimxZendeskSupport', () {
    test('initialize', () async {
      await platform.initialize(
        url: 'https://test.zendesk.com',
        appId: 'app_id',
        clientId: 'client_id',
        name: 'test user',
        emailId: 'test@example.com',
        userId: 'user_123',
        jwtToken: 'test_jwt',
      );

      expect(log, <Matcher>[
        isMethodCall(
          'initialize',
          arguments: <String, dynamic>{
            'zendeskUrl': 'https://test.zendesk.com',
            'appId': 'app_id',
            'clientId': 'client_id',
            'name': 'test user',
            'emailId': 'test@example.com',
            'userId': 'user_123',
            'jwtToken': 'test_jwt',
          },
        ),
      ]);
    });

    test('showHelpCenter', () async {
      await platform.showHelpCenter(
        name: 'test user',
        emailId: 'test@example.com',
        userId: 'user_123',
        categoryIdList: [1, 2, 3],
      );

      expect(log, <Matcher>[
        isMethodCall(
          'showHelpCenter',
          arguments: <String, dynamic>{
            'name': 'test user',
            'emailId': 'test@example.com',
            'userId': 'user_123',
            'categoryIdList': [1, 2, 3],
          },
        ),
      ]);
    });

    test('showHelpCenterArticleId', () async {
      await platform.showHelpCenterArticleId(articleId: 'art_123');

      expect(log, <Matcher>[
        isMethodCall(
          'showHelpCenterAriticleId',
          arguments: <String, dynamic>{'articleId': 'art_123'},
        ),
      ]);
    });

    test('showHelpCenterCategoryId', () async {
      await platform.showHelpCenterCategoryId(categoryId: 'cat_123');

      expect(log, <Matcher>[
        isMethodCall(
          'showHelpCenterCategoryId',
          arguments: <String, dynamic>{'categoryId': 'cat_123'},
        ),
      ]);
    });

    test('sendUserInformationForTicket', () async {
      await platform.sendUserInformationForTicket(
        name: 'test user',
        emailId: 'test@example.com',
        userId: 'user_123',
        tripId: 'trip_456',
      );

      expect(log, <Matcher>[
        isMethodCall(
          'sendUserInformationForTicket',
          arguments: <String, dynamic>{
            'name': 'test user',
            'emailId': 'test@example.com',
            'userId': 'user_123',
            'tripId': 'trip_456',
          },
        ),
      ]);
    });

    test('startChatBot', () async {
      await platform.startChatBot();

      expect(log, <Matcher>[isMethodCall('startChatBot', arguments: null)]);
    });

    test('showListOfTickets', () async {
      await platform.showListOfTickets(
        name: 'test user',
        emailId: 'test@example.com',
        userId: 'user_123',
        tripId: 'trip_456',
      );

      expect(log, <Matcher>[
        isMethodCall(
          'showListOfTickets',
          arguments: <String, dynamic>{
            'name': 'test user',
            'emailId': 'test@example.com',
            'userId': 'user_123',
            'tripId': 'trip_456',
          },
        ),
      ]);
    });

    test('startChat', () async {
      await platform.startChat(
        name: 'test user',
        emailId: 'test@example.com',
        phoneNumber: '123456789',
      );

      expect(log, <Matcher>[
        isMethodCall(
          'startChat',
          arguments: <String, dynamic>{
            'name': 'test user',
            'emailId': 'test@example.com',
            'phoneNumber': '123456789',
          },
        ),
      ]);
    });

    test('setPushToken', () async {
      await platform.setPushToken('test_token');

      expect(log, <Matcher>[
        isMethodCall(
          'setPushToken',
          arguments: <String, dynamic>{'token': 'test_token'},
        ),
      ]);
    });

    test('setThemeColor', () async {
      await platform.setThemeColor(0xFFCC0000);

      expect(log, <Matcher>[
        isMethodCall(
          'setThemeColor',
          arguments: <String, dynamic>{'color': 0xFFCC0000},
        ),
      ]);
    });
  });
}
