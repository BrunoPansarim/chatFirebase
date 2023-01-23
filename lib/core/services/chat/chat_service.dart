import 'package:chatfirebase/core/models/chat_message.dart';
import 'package:chatfirebase/core/models/chat_user.dart';

import 'chat_firebase_.dart';

abstract class ChatService {
  Stream<List<ChatMessage>> messagesStream();
  Future<ChatMessage?> save(String text, ChatUser user);

  factory ChatService() {
    return ChatFirebaseService();
  }
}