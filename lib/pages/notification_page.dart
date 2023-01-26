import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import '../core/models/chat_notification.dart';
import '../notification/chat_notification_service.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ChatNotificationService>(context);
    final items = service.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificações'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Ionicons.trash_outline),
        onPressed: () {
          Provider.of<ChatNotificationService>(
            context,
            listen: false,
          ).delete(ChatNotification(
            title: 'Add uma notificação!',
            body: Random().nextDouble().toString(),
          ));
        },
      ),
      body: ListView.builder(
          itemCount: service.itemsCount,
          itemBuilder: (ctx, i) => ListTile(
            title: Text(items[i].title),
            subtitle: Text(items[i].body),
            onTap: () => service.remove(i),
          ),
        ),
      );
  }
}
