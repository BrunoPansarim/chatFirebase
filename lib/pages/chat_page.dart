import 'package:chatfirebase/components/messages.dart';
import 'package:chatfirebase/components/new_message.dart';
import 'package:chatfirebase/core/services/auth/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BrunoChat'),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color
            ),
              items: [
                DropdownMenuItem(
                    child: Row(
                      children: const [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text('Exit'),
                      ],
                    ),
                ),
              ],
            onChanged: (value) {
              if(value == 'logout') {
                AuthService().logout();
              }
            }
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: const [
            Expanded(child: Messages()),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
