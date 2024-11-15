import 'package:flutter/material.dart';

void myShowSnackBarMethod(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
      ),
    ),
  );
}
