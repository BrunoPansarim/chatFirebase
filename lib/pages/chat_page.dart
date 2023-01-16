import 'package:chatfirebase/core/services/auth/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Chat Page'),
              TextButton(
                onPressed: () {
                  AuthService().logout();
                },
                child: Text('Logout'),
          ),
        ],
      )),
    );
  }
}
