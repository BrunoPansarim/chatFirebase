import 'package:chatfirebase/components/messages.dart';
import 'package:chatfirebase/components/new_message.dart';
import 'package:chatfirebase/core/services/auth/auth_services.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BrunoChat',
          textAlign: TextAlign.center,
        ),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
                icon: Icon(Icons.more_vert,
                    color: Theme.of(context).primaryIconTheme.color),
                items: [
                  DropdownMenuItem(
                    value: 'logout',
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
                  if (value == 'logout') {
                    AuthService().logout();
                  }
                }),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
            ],
          )
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
