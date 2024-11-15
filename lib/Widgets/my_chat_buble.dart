import 'package:flutter/material.dart';
import 'package:my_chat_app/ModeLs/my_message_model.dart';
import 'package:my_chat_app/my_constants.dart';

class MyChatBubLe extends StatelessWidget {
  const MyChatBubLe({
    super.key,
    required this.myMessage,
  });
  final MyMessageModeL myMessage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
        decoration: BoxDecoration(
          color: kPrimaryCoLor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
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
