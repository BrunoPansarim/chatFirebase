import 'package:chatfirebase/notification/chat_notification_service.dart';
import 'package:chatfirebase/pages/auth_or_app_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatNotificationService(),
        ),
      ],
      child: MaterialApp (
      title: 'Chat',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const AuthOrPage(),
      debugShowCheckedModeBanner: false,
      ),
    );
  }
}
