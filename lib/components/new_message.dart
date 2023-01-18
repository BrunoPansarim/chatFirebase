import 'package:chatfirebase/core/services/auth/auth_services.dart';
import 'package:chatfirebase/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _NewMessageState extends State<NewMessage> {
  String _message = '';
  final _messageController = TextEditingController();

  Future <void> _sendMessage() async {
    final user = AuthService().currentUser;

    if(user != null) {
      await ChatService().save(_message, user);
    _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            onChanged: (msg) => setState(() => _message = msg),
            decoration: InputDecoration(
              labelText: 'Send Msg...',
            ),
            onSubmitted: (_) {
              if(_message.trim().isNotEmpty) {
                _sendMessage();
              }
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: _message.trim().isEmpty ? null : _sendMessage,
        ),
      ],
    );
  }
}
