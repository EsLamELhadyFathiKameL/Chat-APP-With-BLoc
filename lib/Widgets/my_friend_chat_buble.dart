import 'package:flutter/material.dart';
import 'package:my_chat_app/ModeLs/my_message_model.dart';

class MyFriendChatBubLe extends StatelessWidget {
  const MyFriendChatBubLe({
    super.key,
    required this.myMessage,
  });
  final MyMessageModeL myMessage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
        decoration: const BoxDecoration(
          color: Color(0XFF006387),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
            topLeft: Radius.circular(32),
          ),
        ),
        child: Text(
          myMessage.myMessage,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
