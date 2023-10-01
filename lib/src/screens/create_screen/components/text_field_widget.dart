import 'package:flutter/material.dart';

import '../../../common/styles/text_style.dart';

class WidgetTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int? maxLines;
  final TextInputType? textInputType;

  const WidgetTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines,
    this.textInputType
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: Styles.textField,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 17,
      ),
    );
  }
}
