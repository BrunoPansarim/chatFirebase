import 'dart:async';
import 'dart:math';

import 'package:chatfirebase/components/new_message.dart';
import 'package:chatfirebase/core/models/chat_message.dart';
import 'package:chatfirebase/core/models/chat_user.dart';
import 'package:chatfirebase/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
      _controller = controller;
      controller.add(_msgs);
});

  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStream;
  }

  // @override
  // Stream<List<ChatMessage>> messageStream() {
  //   throw UnimplementedError();
  // }

  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
          id: Random().nextDouble().toString(),
          text: text,
          createdAt: DateTime.now(),
          userId: userId,
          username: username,
          userImageURL: userImageURL,
    );
    _msgs.add(newMessage);
    _controller?.add(_msgs);
    return NewMessage;
  }
}