import 'dart:async';
import 'dart:math';

import 'package:chatfirebase/core/models/chat_message.dart';
import 'package:chatfirebase/core/models/chat_user.dart';
import 'package:chatfirebase/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: '1',
      text: 'Bom dia',
      createdAt: DateTime.now().toString(),
      userId: 'teste',
      username: 'xD123',
      userImageURL: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '2',
      text: 'Boa tarde',
      createdAt: DateTime.now().toString(),
      userId: '543',
      username: 'Trollzinho',
      userImageURL: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '3',
      text: 'Boa Noite',
      createdAt: DateTime.now().toString(),
      userId: 'teste2',
      username: 'xP123',
      userImageURL: 'assets/images/avatar.png',
    ),
  ];

  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStream;
  }

  @override
  Stream<List<ChatMessage>> messageStream() {
    throw UnimplementedError();
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now().toString(),
      userId: user.id,
      username: user.name,
      userImageURL: user.imageURL,
    );
    _msgs.add(newMessage);
    _controller?.add(_msgs);
    return newMessage;
  }
}
