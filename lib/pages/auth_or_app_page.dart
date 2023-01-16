import 'package:chatfirebase/core/models/chat_user.dart';
import 'package:chatfirebase/core/services/auth/auth_services.dart';
import 'package:chatfirebase/pages/auth_page.dart';
import 'package:chatfirebase/pages/chat_page.dart';
import 'package:chatfirebase/pages/loading_page.dart';
import 'package:flutter/material.dart';

class AuthOrPage extends StatelessWidget {
  const AuthOrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ChatUser?>(
        stream: AuthService().userChanges,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage(title: '',);
          } else {
            return snapshot.hasData ? const ChatPage() : const AuthPage();
          }
        },
      ),
    );
  }
}
