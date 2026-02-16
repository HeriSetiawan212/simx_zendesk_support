import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simx_zendesk_support/simx_zendesk_support.dart';
import 'package:simx_zendesk_support/simx_zendesk_support_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSimxZendeskSupportPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements SimxZendeskSupportPlatform {}

void main() {
  late SimxZendeskSupport zendesk;
  late MockSimxZendeskSupportPlatform mockPlatform;

  setUp(() {
    zendesk = SimxZendeskSupport();
    mockPlatform = MockSimxZendeskSupportPlatform();
    SimxZendeskSupportPlatform.instance = mockPlatform;
  });

  group('SimxZendeskSupport', () {
    test('initialize calls platform.initialize', () async {
      when(
        () => mockPlatform.initialize(
          url: any(named: 'url'),
          appId: any(named: 'appId'),
          clientId: any(named: 'clientId'),
          name: any(named: 'name'),
          emailId: any(named: 'emailId'),
          userId: any(named: 'userId'),
          jwtToken: any(named: 'jwtToken'),
        ),
      ).thenAnswer((_) async {});

      await zendesk.initialize(
        url: 'url',
        appId: 'appId',
        clientId: 'clientId',
        name: 'name',
        emailId: 'emailId',
        userId: 'userId',
        jwtToken: 'jwtToken',
      );

      verify(
        () => mockPlatform.initialize(
          url: 'url',
          appId: 'appId',
          clientId: 'clientId',
          name: 'name',
          emailId: 'emailId',
          userId: 'userId',
          jwtToken: 'jwtToken',
        ),
      ).called(1);
    });

    test('showHelpCenter calls platform.showHelpCenter', () async {
      when(
        () => mockPlatform.showHelpCenter(
          name: any(named: 'name'),
          emailId: any(named: 'emailId'),
          userId: any(named: 'userId'),
          categoryIdList: any(named: 'categoryIdList'),
        ),
      ).thenAnswer((_) async {});

      await zendesk.showHelpCenter(
        name: 'name',
        emailId: 'emailId',
        userId: 'userId',
        categoryIdList: [1, 2],
      );

      verify(
        () => mockPlatform.showHelpCenter(
          name: 'name',
          emailId: 'emailId',
          userId: 'userId',
          categoryIdList: [1, 2],
        ),
      ).called(1);
    });

    test('startChatBot calls platform.startChatBot', () async {
      when(() => mockPlatform.startChatBot()).thenAnswer((_) async {});

      await zendesk.startChatBot();

      verify(() => mockPlatform.startChatBot()).called(1);
    });

    test(
      'showHelpWithArticleId calls platform.showHelpCenterArticleId',
      () async {
        when(
          () => mockPlatform.showHelpCenterArticleId(
            articleId: any(named: 'articleId'),
          ),
        ).thenAnswer((_) async {});

        await zendesk.showHelpWithArticleId(articleId: 'articleId');

        verify(
          () => mockPlatform.showHelpCenterArticleId(articleId: 'articleId'),
        ).called(1);
      },
    );

    test(
      'showHelpWithCategoryId calls platform.showHelpCenterCategoryId',
      () async {
        when(
          () => mockPlatform.showHelpCenterCategoryId(
            categoryId: any(named: 'categoryId'),
          ),
        ).thenAnswer((_) async {});

        await zendesk.showHelpWithCategoryId(categoryId: 'categoryId');

        verify(
          () => mockPlatform.showHelpCenterCategoryId(categoryId: 'categoryId'),
        ).called(1);
      },
    );

    test(
      'sendUserInformationForTicket calls platform.sendUserInformationForTicket',
      () async {
        when(
          () => mockPlatform.sendUserInformationForTicket(
            name: any(named: 'name'),
            emailId: any(named: 'emailId'),
            userId: any(named: 'userId'),
            tripId: any(named: 'tripId'),
          ),
        ).thenAnswer((_) async {});

        await zendesk.sendUserInformationForTicket(
          name: 'name',
          emailId: 'emailId',
          userId: 'userId',
          tripId: 'tripId',
        );

        verify(
          () => mockPlatform.sendUserInformationForTicket(
            name: 'name',
            emailId: 'emailId',
            userId: 'userId',
            tripId: 'tripId',
          ),
        ).called(1);
      },
    );

    test('showListOfTickets calls platform.showListOfTickets', () async {
      when(
        () => mockPlatform.showListOfTickets(
          name: any(named: 'name'),
          emailId: any(named: 'emailId'),
          userId: any(named: 'userId'),
          tripId: any(named: 'tripId'),
        ),
      ).thenAnswer((_) async {});

      await zendesk.showListOfTickets(
        name: 'name',
        emailId: 'emailId',
        userId: 'userId',
        tripId: 'tripId',
      );

      verify(
        () => mockPlatform.showListOfTickets(
          name: 'name',
          emailId: 'emailId',
          userId: 'userId',
          tripId: 'tripId',
        ),
      ).called(1);
    });

    test('startChat calls platform.startChat', () async {
      when(
        () => mockPlatform.startChat(
          name: any(named: 'name'),
          emailId: any(named: 'emailId'),
          phoneNumber: any(named: 'phoneNumber'),
        ),
      ).thenAnswer((_) async {});

      await zendesk.startChat(
        name: 'name',
        emailId: 'emailId',
        phoneNumber: 'phoneNumber',
      );

      verify(
        () => mockPlatform.startChat(
          name: 'name',
          emailId: 'emailId',
          phoneNumber: 'phoneNumber',
        ),
      ).called(1);
    });

    test('setPushToken calls platform.setPushToken', () async {
      when(() => mockPlatform.setPushToken(any())).thenAnswer((_) async {});

      await zendesk.setPushToken('token');

      verify(() => mockPlatform.setPushToken('token')).called(1);
    });

    test('setThemeColor calls platform.setThemeColor', () async {
      when(() => mockPlatform.setThemeColor(any())).thenAnswer((_) async {});

      await zendesk.setThemeColor(0xFF00FF00);

      verify(() => mockPlatform.setThemeColor(0xFF00FF00)).called(1);
    });
  });
}
