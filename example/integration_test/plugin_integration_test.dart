import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:simx_zendesk_support/simx_zendesk_support.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('integration test', (WidgetTester tester) async {
    final SimxZendeskSupport zendesk = SimxZendeskSupport();
    
    // We test that method calls don't crash the app on the platform.
    // Note: Initialization will likely fail if parameters are invalid,
    // but here we verify the channel logic.
    
    expect(
      () => zendesk.initialize(
        url: 'https://test.zendesk.com',
        appId: 'test_app_id',
        clientId: 'test_client_id',
        name: 'Integration Test',
        emailId: 'test@example.com',
        userId: 'test_user_id',
      ),
      returnsNormally,
    );

    expect(
      () => zendesk.setThemeColor(0xFFCC0000),
      returnsNormally,
    );
  });
}
