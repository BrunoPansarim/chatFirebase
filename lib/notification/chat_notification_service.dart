import 'package:flutter/cupertino.dart';

import '../core/models/chat_notification.dart';

class ChatNotificationService with ChangeNotifier {
  final List<ChatNotification> _items = [];

  List<ChatNotification> get itens {
    return [..._items];
  }

  void add(ChatNotification notification) {
    _items.add(notification);
    notifyListeners();
  }
  void remove(int i) {
    _items.removeAt(i);
    notifyListeners();
  }
}