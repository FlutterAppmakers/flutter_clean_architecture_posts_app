import 'package:flutter/material.dart';

import '../../features/posts/presentation/pages/posts_page.dart';

class SnackBarMessage {
  void showSuccessSnackBar({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content:
        Text(message, style:  TextStyle(color: Colors.white),),
          backgroundColor: Colors.green,
        )
    );
  }

  void showErrorSnackBar({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content:
        Text(message, style:  TextStyle(color: Colors.white),),
          backgroundColor: Colors.redAccent,
        )
    );
  }
}
