import 'package:flutter/material.dart';
import 'package:simx_zendesk_support/simx_zendesk_support.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _zendeskSupport = SimxZendeskSupport();
  String _status = 'Not Initialized';
  final String _zendeskUrl = 'https://simxsupport.zendesk.com';
  final String _zendeskAppId =
      'eff19831ca5f814df1a15f16994a6fedbc08eb6d262b5fc4';
  final String _zendeskClientId = 'mobile_sdk_client_8eeb1c750082eae7ca31';
  final String _zendeskName = 'Bambang Heri Setiawan';
  final String _zendeskEmailId = 'bambangherisetiawan@gmail.com';
  final String _zendeskUserId = 'unique_user_id_123';

  @override
  void initState() {
    super.initState();
    _initZendesk();
  }

  Future<void> _initZendesk() async {
    try {
      await _zendeskSupport.initialize(
        url: _zendeskUrl,
        appId: _zendeskAppId,
        clientId: _zendeskClientId,
        name: _zendeskName,
        emailId: _zendeskEmailId,
        userId: _zendeskUserId,
      );
      if (!mounted) return;
      setState(() {
        _status = 'Initialized';
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _status = 'Initialization Failed: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Simx Zendesk Support Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Status: $_status'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _zendeskSupport.showHelpCenter(
                    name: _zendeskName,
                    emailId: _zendeskEmailId,
                    userId: _zendeskUserId,
                    categoryIdList: [],
                  );
                },
                child: const Text('Show Help Center'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _zendeskSupport.startChat(
                    name: _zendeskName,
                    emailId: _zendeskEmailId,
                    phoneNumber: '1234567890',
                  );
                },
                child: const Text('Start Chat'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _zendeskSupport.startChatBot();
                },
                child: const Text('Start Chat Bot'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
