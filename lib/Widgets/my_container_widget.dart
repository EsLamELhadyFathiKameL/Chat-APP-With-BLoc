import 'package:flutter/material.dart';
import 'package:my_chat_app/my_constants.dart';

class MyContainerWidget extends StatelessWidget {
  const MyContainerWidget({
    super.key,
    required this.textName,
    this.onTap,
  });
  final String textName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          textName,
          style: TextStyle(
            fontSize: 15,
            color: kPrimaryCoLor,
            fontFamily: "Pacifico",
          ),
        ),
      ),
    );
  }
}
