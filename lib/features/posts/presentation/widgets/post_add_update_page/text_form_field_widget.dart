import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool multiLines;
  final String name;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.multiLines,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        controller: controller,
        validator: (val)=> val!.isEmpty ? "$name can't be Empty": null,
        decoration: InputDecoration(
            hintText: name
        ),
        minLines: multiLines ? 6 : 1,
        maxLines: multiLines ? 6 : 1,
      ),
    );
  }
}
