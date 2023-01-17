import 'package:chatfirebase/core/models/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool belongsToCurrentUser;

  const MessageBubble(
      {Key? key, required this.message, required this.belongsToCurrentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: belongsToCurrentUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                color: belongsToCurrentUser
                    ? Colors.greenAccent
                    : Theme.of(context).accentColor,
                borderRadius: const BorderRadius.all(Radius.elliptical(5, 5)),
              ),
              width: 180,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              child: Column(children: [
                Text(
                  message.username,
                  style: TextStyle(
                      color: belongsToCurrentUser ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  message.text,
                  style: TextStyle(
                    color: belongsToCurrentUser ? Colors.black : Colors.white,
                  ),
                ),
              ])),
     ]);
  }
}
