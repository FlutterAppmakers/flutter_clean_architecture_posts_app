import 'package:flutter/material.dart';

class FormSubmitBtn extends StatelessWidget {
  final bool isUpdatePost;
  final void Function()? onPressed;
  const FormSubmitBtn({super.key, required this.isUpdatePost, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: isUpdatePost ? Icon(Icons.edit) : Icon(Icons.add),
      label: Text(isUpdatePost ? "Update" : "Add"),
    );
  }
}
