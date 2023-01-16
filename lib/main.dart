import 'package:chatfirebase/pages/auth_or_app_page.dart';
import 'package:chatfirebase/pages/auth_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
