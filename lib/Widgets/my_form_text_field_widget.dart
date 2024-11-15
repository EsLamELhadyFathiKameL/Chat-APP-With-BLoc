import 'package:flutter/material.dart';
import 'package:my_chat_app/Methods/my_show_snack_bar_method.dart';

class MyFormTextFieLdWidget extends StatelessWidget {
  const MyFormTextFieLdWidget({
    super.key,
    required this.hintText,
    this.onChanged,
    required this.obscureText,
  });
  final String hintText;
  final void Function(String)? onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          myShowSnackBarMethod(context, "FieLd Is Required.");
          return "FieLd Is Required.";
        }
        return null;
      },
      onChanged: onChanged,
      obscureText: obscureText,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontFamily: "Pacifico",
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
