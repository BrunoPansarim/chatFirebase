import 'package:chatfirebase/core/models/chat_message.dart';
import 'package:chatfirebase/core/services/auth/auth_services.dart';
import 'package:chatfirebase/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';
import 'message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;
    return  StreamBuilder<List<ChatMessage>>(
      stream: ChatService().messagesStream(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Vazio'));
      } else {
          final msgs = snapshot.data!;
          return ListView.builder(
            reverse: true,
            itemCount: msgs.length,
            itemBuilder: (ctx, i) => MessageBubble(
              key: ValueKey(msgs[i].id),
              message: msgs[i],
              belongsToCurrentUser: currentUser?.id == msgs[i].userId,
            ),
          );
        }
      }
    );
  }
}
