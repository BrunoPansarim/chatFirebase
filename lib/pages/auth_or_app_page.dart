import 'package:chatfirebase/core/models/chat_user.dart';
import 'package:chatfirebase/core/services/auth/auth_services.dart';
import 'package:chatfirebase/pages/auth_page.dart';
import 'package:chatfirebase/pages/chat_page.dart';
import 'package:chatfirebase/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import '../notification/chat_notification_service.dart';

class AuthOrPage extends StatelessWidget {
  const AuthOrPage({super.key});

  Future<void> init(context) async {
    await Firebase.initializeApp();
    await Provider.of<ChatNotificationService>(
      context,
      listen: false,
    ).init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: init(context),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage(title: '');
          } else {
            return StreamBuilder<ChatUser?>(
              stream: AuthService().userChanges,
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingPage(title: '',);
                } else {
                  return snapshot.hasData ? const ChatPage() : const AuthPage();
                }
              },
            );
          }
        }
    );
  }
}